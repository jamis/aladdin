module CalendarsHelper
  def each_week(relative_start, count)
    start = relative_start.beginning_of_week
    count.times do |week|
      yield week, start
      start = start.next_week
    end
  end

  def colors_for_date(date)
    today = Time.zone.today

    if date < today
      { header_bg: 'bg-gray-200',
        bg: 'bg-gray-100' }
    elsif date == today
      { header_bg: 'bg-yellow-100',
        bg: 'bg-yellow-50' }
    else
      { header_bg: 'bg-gray-50',
        bg: 'bg-white' }
    end
  end

  def session_model
    Session.new(activity: @activity, tags: @activity&.tags || [])
  end

  def tags_by_activity
    Activity.active.each_with_object({}) do |activity, map|
      map[activity.id] = activity.tag_list
    end
  end

  def activity_options
    Activity.active.by_name.map { |a| [ a.name, a.id ] }
  end
end
