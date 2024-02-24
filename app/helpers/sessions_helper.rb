module SessionsHelper
  def engagements_with(session)
    default = Hash.new { |id| Engagement.new(resident_id: id, session_id: session.id) }
    session.engagements.each_with_object(default) do |e, h|
      h[e.resident_id] = e
    end
  end

  def each_resident_with_engagement_for(session)
    residents = Resident.all.order(name: 'ASC')
    map = engagements_with(session)

    index = 0
    residents.each do |resident|
      engagement = map[resident.id]
      next if resident.former? && engagement.new_record?

      yield resident, engagement, index
      index += 1
    end
  end
end
