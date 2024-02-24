class ActivitiesController < ApplicationController
  include Calendrical

  before_action :find_activity, only: %i[ show row edit update destroy ]
  before_action :prepare_calendar, only: :show

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
    @activity.destroy if @activity.deletable?
  end

  private

  def calendar_scope
    @activity.sessions
  end

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
