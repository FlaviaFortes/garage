# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artist = Artist.first_or_initialize(name: "Metallica") do |a|
  a.email = "metallica@garage.com"
  a.description = "We're an awesome band!"
  a.avatar_file_name = "assets/metallica.jpg"
  a.save!
end