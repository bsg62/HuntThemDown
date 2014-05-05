# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OffenseType.create(id: 1, name: 'Warning', slug: 'warnings')
OffenseType.create(id: 2, name: 'Suspension', slug: 'suspensions')

Victim.create(id: 1, name: 'The Troll')

User.create(id: 1, name: 'Test', password: 'test')

Offense.create(
  id: 1,
  victim_id: 1,
  offense_type_id: 1,
  user_id: 1,
  name: 'Troll 1',
  duration: '',
  expires_at: nil,
  reason: 'is a troll',
  url: 'http://www.google.com/',
  ip_address: '127.0.0.1',
  hostname: 'localhost'
)

Offense.create(
    id: 2,
    victim_id: 1,
    offense_type_id: 2,
    user_id: 1,
    name: 'Troll 2',
    duration: '',
    expires_at: nil,
    reason: 'is a troll',
    url: 'http://www.google.com/',
    ip_address: '8.8.8.8',
    hostname: 'google-public-dns-a.google.com'
)

Comment.create(
  id: 1,
  user_id: 1,
  victim_id: 1,
  body: 'Beware! It\'s a troll!'
)