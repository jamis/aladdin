class ResidentsController < ApplicationController
  before_action :find_resident, only: %i[ show row edit update ]

  def index
    @residents = resident_list
    @former    = former_resident_list
  end

  def create
    @resident = Resident.create!(resident_params)
    @residents = resident_list
  end

  def upload
    Resident.import(params[:residents])
    redirect_to residents_path
  end

  def update
    @resident.update(resident_params)

    @residents = resident_list
    @former    = former_resident_list
  end

  private

  def find_resident
    @resident = Resident.find(params[:id])
  end

  def resident_list
    Resident.current.order(room: 'ASC')
  end

  def former_resident_list
    Resident.former.order(name: 'ASC')
  end

  def resident_params
    params.require(:resident).permit(:name, :room, :current)
  end
end
