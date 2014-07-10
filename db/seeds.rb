# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Clear tables'
ActiveRecord::Base.connection.execute("TRUNCATE TABLE suits RESTART IDENTITY;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE trump_types RESTART IDENTITY;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE statuses RESTART IDENTITY;")

puts 'Create'
puts '-Suits'
Suit.create([{name:'Spades'}, {name:'Hearts'}, {name:'Clubs'}, {name:'Diamonds'}])
puts '-Trump types'
TrumpType.create([{name:'Random'}, {name:'WinnerPicks'}])
puts '-Statuses'
Status.create([{name:'In progress'},{name:'Complete'}])

puts 'Done'