# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

number_of_districts = 11
number_of_districts.times do |n|
  # Note: there is a uniqueness validation in 
  # District model
  District.create(district_number: n+1)
end

Supervisor.xml_parser

