# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
players_list = [
  [ "Tanner F.", 10, 1 ],
  [ "Luke D.", 8, 2 ],
  [ "Scott P.", 7, 3],
  [ "Rocky B.", 6, 4],
  [ "SpiderWoman", 5, 5]
]

players_list.each do |name, score, rank|
  Player.create( name: name, score: score, rank: rank )
end