class ActivitiesController < ApplicationController
  before_action :find_activity, only: %i[ show edit update destroy ]

  def index
    @activities = activity_list
    @archived   = archived_activity_list
  end

  def create
    @activity = Activity.create!(activity_params)
    @activities = activity_list
  end

  def update
    @activity.update(activity_params)

    @activities = activity_list
    @archived   = archived_activity_list
  end

  def destroy
    @activity.destroy
  end

  private

  def find_activity
    @activity = Activity.find(params[:id])
  end

  def activity_list
    Activity.active.order(name: 'ASC')
  end

  def archived_activity_list
    Activity.archived.order(name: 'ASC')
  end

  def activity_params
    params.require(:activity).permit(:name, :abbv, :archived)
  end
end
