unless Rails.env.production?
  cognitive = Tag.create!(name: 'cognitive')
  social = Tag.create!(name: 'social')
  physical = Tag.create!(name: 'physical')
  creative = Tag.create!(name: 'creative')
  outing = Tag.create!(name: 'outing')
  concert = Tag.create!(name: 'concert')
  indoor = Tag.create!(name: 'indoor')
  volunteers = Tag.create!(name: 'volunteers')
  community = Tag.create!(name: 'community')
  kids = Tag.create!(name: 'kids')
  music = Tag.create!(name: 'music')
  food = Tag.create!(name: 'food')

  humphrey = Resident.create!(name: 'Humphrey B', room: '112')
  sophia = Resident.create!(name: 'Sophia L', room: '217')
  danny = Resident.create!(name: 'Danny K', room: '143')
  bing = Resident.create!(name: 'Bing C', room: '222')
  myrna = Resident.create!(name: 'Myrna L', room: '111', current: false)

  wttw = Activity.create!(name: 'Welcome to the Week', abbv: 'WttW', tags: [ cognitive ])
  drum = Activity.create!(name: 'Drumming', abbv: 'Drum', tags: [ cognitive, social, physical, music ])
  kclub = Activity.create!(name: "Kid's Club", abbv: 'KC', tags: [ social, music, kids, community ])
  mingle = Activity.create!(name: 'Monday Mingle', abbv: 'MM', tags: [ social, community, food ])
  drive = Activity.create!(name: 'Scenic Drive', abbv: 'SD', tags: [ outing, cognitive ])
  concert = Activity.create!(name: 'Concert', abbv: 'Concert', tags: [ music, concert, cognitive, volunteers ])
  crafts = Activity.create!(name: 'Arts & Crafts', abbv: 'A&C', tags: [ cognitive, social, creative ])

  monday = Date.today.beginning_of_week + 1
  tuesday = monday + 1
  friday = monday + 4

  wttw_1 = wttw.sessions.create(occurred_on: monday, tags: wttw.tags)
  wttw_2 = wttw.sessions.create(occurred_on: monday + 7, tags: wttw.tags)
  drum_1 = drum.sessions.create(occurred_on: tuesday, tags: drum.tags)
  drum_2 = drum.sessions.create(occurred_on: tuesday + 7, tags: drum.tags)
  kclub_1 = kclub.sessions.create(occurred_on: friday, tags: kclub.tags)
  kclub_2 = kclub.sessions.create(occurred_on: friday + 7, tags: kclub.tags)
  mingle_1 = mingle.sessions.create(occurred_on: monday, tags: mingle.tags)
  mingle_2 = mingle.sessions.create(occurred_on: monday + 7, tags: mingle.tags)

  wttw_1.tap do |sess|
    sess.engagements.create(resident: humphrey, invited: true)
    sess.engagements.create(resident: sophia, invited: true, attended: true)
    sess.engagements.create(resident: danny, attended: true)
    sess.engagements.create(resident: bing, invited: true, attended: true)
  end

  wttw_2.tap do |sess|
    sess.engagements.create(resident: humphrey, invited: true, attended: true)
    sess.engagements.create(resident: sophia, invited: true, attended: true, notes: 'they fell asleep')
    sess.engagements.create(resident: danny, invited: true)
    sess.engagements.create(resident: bing, invited: true, attended: true)
  end

  drum_1.tap do |sess|
    sess.engagements.create(resident: humphrey, invited: true, attended: true)
    sess.engagements.create(resident: sophia, invited: true)
    sess.engagements.create(resident: danny, attended: true)
    sess.engagements.create(resident: bing, invited: true, attended: true)
  end

  drum_2.tap do |sess|
    sess.engagements.create(resident: humphrey, invited: true, attended: true)
    sess.engagements.create(resident: sophia, invited: true)
    sess.engagements.create(resident: danny, attended: true)
    sess.engagements.create(resident: bing, invited: true, attended: true)
  end

  kclub_1.tap do |sess|
    sess.engagements.create(resident: humphrey, invited: true)
    sess.engagements.create(resident: sophia, invited: true, attended: true)
    sess.engagements.create(resident: danny, invited: true, attended: true)
  end

  kclub_2.tap do |sess|
    sess.engagements.create(resident: humphrey, invited: true, attended: true)
    sess.engagements.create(resident: sophia, invited: true, attended: true)
    sess.engagements.create(resident: danny, invited: true, attended: true)
    sess.engagements.create(resident: bing, invited: true)
  end

  mingle_1.tap do |sess|
    sess.engagements.create(resident: sophia, invited: true)
    sess.engagements.create(resident: danny, invited: true, attended: true)
    sess.engagements.create(resident: bing, invited: true)
  end

  mingle_2.tap do |sess|
    sess.engagements.create(resident: humphrey, invited: true)
    sess.engagements.create(resident: sophia, invited: true, attended: true)
    sess.engagements.create(resident: danny, invited: true, attended: true)
  end
end
