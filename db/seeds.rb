humphrey = Resident.create!(name: 'Humphrey B', room: '112')
sophia = Resident.create!(name: 'Sophia L', room: '217')
danny = Resident.create!(name: 'Danny K', room: '143')
bing = Resident.create!(name: 'Bing C', room: '222')
myrna = Resident.create!(name: 'Myrna L', room: '111', current: false)

wttw = Activity.create!(name: 'Welcome to the Week', abbv: 'WttW')
drum = Activity.create!(name: 'Drumming', abbv: 'Drum')
kclub = Activity.create!(name: "Kid's Club", abbv: 'KC')
mingle = Activity.create!(name: 'Monday Mingle', abbv: 'MM')

physical = Goal.create(name: 'PHYSICAL', code: '1')
cognitive = Goal.create(name: 'COGNITIVE', code: '2')
social = Goal.create(name: 'SOCIAL', code: '3')

wttw_0212 = wttw.sessions.create(occurred_on: '2024-02-12', goals: [ social, cognitive ])
wttw_0219 = wttw.sessions.create(occurred_on: '2024-02-19', goals: [ social, cognitive ])
drum_0213 = drum.sessions.create(occurred_on: '2024-02-13', goals: [ social, physical ])
drum_0220 = drum.sessions.create(occurred_on: '2024-02-20', goals: [ social, physical ])
kclub_0209 = kclub.sessions.create(occurred_on: '2024-02-09', goals: [ social ])
kclub_0216 = kclub.sessions.create(occurred_on: '2024-02-16', goals: [ social ])
mingle_0212 = mingle.sessions.create(occurred_on: '2024-02-12', goals: [ social ])
mingle_0219 = mingle.sessions.create(occurred_on: '2024-02-19', goals: [ social ])

wttw_0212.tap do |sess|
  sess.engagements.create(resident: humphrey, invited: true)
  sess.engagements.create(resident: sophia, invited: true, attended: true)
  sess.engagements.create(resident: danny, attended: true)
  sess.engagements.create(resident: bing, invited: true, attended: true)
end

wttw_0219.tap do |sess|
  sess.engagements.create(resident: humphrey, invited: true, attended: true)
  sess.engagements.create(resident: sophia, invited: true, attended: true, notes: 'they fell asleep')
  sess.engagements.create(resident: danny, invited: true)
  sess.engagements.create(resident: bing, invited: true, attended: true)
end

drum_0213.tap do |sess|
  sess.engagements.create(resident: humphrey, invited: true, attended: true)
  sess.engagements.create(resident: sophia, invited: true)
  sess.engagements.create(resident: danny, attended: true)
  sess.engagements.create(resident: bing, invited: true, attended: true)
end

drum_0220.tap do |sess|
  sess.engagements.create(resident: humphrey, invited: true, attended: true)
  sess.engagements.create(resident: sophia, invited: true)
  sess.engagements.create(resident: danny, attended: true)
  sess.engagements.create(resident: bing, invited: true, attended: true)
end

kclub_0209.tap do |sess|
  sess.engagements.create(resident: humphrey, invited: true)
  sess.engagements.create(resident: sophia, invited: true, attended: true)
  sess.engagements.create(resident: danny, invited: true, attended: true)
end

kclub_0216.tap do |sess|
  sess.engagements.create(resident: humphrey, invited: true, attended: true)
  sess.engagements.create(resident: sophia, invited: true, attended: true)
  sess.engagements.create(resident: danny, invited: true, attended: true)
  sess.engagements.create(resident: bing, invited: true)
end

mingle_0212.tap do |sess|
  sess.engagements.create(resident: sophia, invited: true)
  sess.engagements.create(resident: danny, invited: true, attended: true)
  sess.engagements.create(resident: bing, invited: true)
end

mingle_0219.tap do |sess|
  sess.engagements.create(resident: humphrey, invited: true)
  sess.engagements.create(resident: sophia, invited: true, attended: true)
  sess.engagements.create(resident: danny, invited: true, attended: true)
end
