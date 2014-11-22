# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
players_list = [
  [ "Dustin", "IsFat", 10, 1 ],
  [ "Luke", "IsSweet", 8, 2 ],
  [ "Scott", "LastName", 7, 3],
  [ "Rocky", "Balboa",6, 4],
  [ "Spider","Man", 5, 5]
]

players_list.each do |first_name, last_name, score, rank|
  Player.create( first_name: first_name, last_name: last_name, score: score, rank: rank )
end