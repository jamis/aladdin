class SessionsController < ApplicationController
  before_action :find_session, only: %i[ show destroy ]

  def create
    @session = Session.create(session_params)
    redirect_back_or_to root_url
  end

  def destroy
    @session.destroy if @session.deletable?
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:activity_id, :occurred_on, :tag_list_json)
  end

  def find_session
    @session = Session.find(params[:id])
  end
end
