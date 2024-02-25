class EngagementsController < ApplicationController
  def create
    Engagement.transaction do
      @engagement = Engagement.where(engagement_params.slice(:resident_id, :session_id)).first
      if @engagement
        @engagement.update!(engagement_params)
      else
        @engagement = Engagement.create!(engagement_params)
      end
    end

    head :no_content
  end

  private

  def engagement_params
    params.require(:engagement).permit(:invited, :attended, :notes, :resident_id, :session_id)
  end
end
