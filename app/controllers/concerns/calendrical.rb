module Calendrical
  extend ActiveSupport::Concern

  private

  def calendar_scope
    Session.all
  end

  def prepare_calendar
    @start_week = start_week
    @sessions   = sessions_by_date(calendar_scope)
  end

  def start_week
    (params[:start] || Date.today.last_week).to_date.beginning_of_week
  end

  def sessions_by_date(scope)
    end_day = @start_week + 5 * 7 - 1
    scope = scope.where(occurred_on: @start_week..end_day)

    scope.group_by(&:occurred_on)
  end
end
