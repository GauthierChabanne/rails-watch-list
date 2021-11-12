# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

url = "http://tmdb.lewagon.com/movie/top_rated?"
user_serialized = URI.open(url).read
top = JSON.parse(user_serialized)
puts "Starting seeding..."

Movie.destroy_all

top["results"].each do |movie|
  params = {
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://www.themoviedb.org/t/p/w1280#{movie['poster_path']}",
    rating: movie['vote_average']
  }
  Movie.create!(params)
end

puts "Seeding ended!"
