john = Resident.create!(name: 'John K', room: '112')
cheryl = Resident.create!(name: 'Cheryl J', room: '217')
ralph = Resident.create!(name: 'Ralph B', room: '143')
janice = Resident.create!(name: 'Janice T', room: '222')

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
  sess.engagements.create(resident: john, invited: true)
  sess.engagements.create(resident: cheryl, invited: true, attended: true)
  sess.engagements.create(resident: ralph, attended: true)
  sess.engagements.create(resident: janice, invited: true, attended: true)
end

wttw_0219.tap do |sess|
  sess.engagements.create(resident: john, invited: true, attended: true)
  sess.engagements.create(resident: cheryl, invited: true, attended: true, notes: 'they fell asleep')
  sess.engagements.create(resident: ralph, invited: true)
  sess.engagements.create(resident: janice, invited: true, attended: true)
end

drum_0213.tap do |sess|
  sess.engagements.create(resident: john, invited: true, attended: true)
  sess.engagements.create(resident: cheryl, invited: true)
  sess.engagements.create(resident: ralph, attended: true)
  sess.engagements.create(resident: janice, invited: true, attended: true)
end

drum_0220.tap do |sess|
  sess.engagements.create(resident: john, invited: true, attended: true)
  sess.engagements.create(resident: cheryl, invited: true)
  sess.engagements.create(resident: ralph, attended: true)
  sess.engagements.create(resident: janice, invited: true, attended: true)
end

kclub_0209.tap do |sess|
  sess.engagements.create(resident: john, invited: true)
  sess.engagements.create(resident: cheryl, invited: true, attended: true)
  sess.engagements.create(resident: ralph, invited: true, attended: true)
end

kclub_0216.tap do |sess|
  sess.engagements.create(resident: john, invited: true, attended: true)
  sess.engagements.create(resident: cheryl, invited: true, attended: true)
  sess.engagements.create(resident: ralph, invited: true, attended: true)
  sess.engagements.create(resident: janice, invited: true)
end

mingle_0212.tap do |sess|
  sess.engagements.create(resident: cheryl, invited: true)
  sess.engagements.create(resident: ralph, invited: true, attended: true)
  sess.engagements.create(resident: janice, invited: true)
end

mingle_0219.tap do |sess|
  sess.engagements.create(resident: john, invited: true)
  sess.engagements.create(resident: cheryl, invited: true, attended: true)
  sess.engagements.create(resident: ralph, invited: true, attended: true)
end
