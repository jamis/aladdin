class CalendarsController < ApplicationController
  include Calendrical

  before_action :prepare_calendar, only: :show
end
