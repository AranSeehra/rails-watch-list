# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"

Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)

url_2 = "https://tmdb.lewagon.com/movie/popular"
user_serialized_2 = URI.open(url_2).read
movies_2 = JSON.parse(user_serialized_2)

movies["results"].each do |movie|
  title = movie["title"]
  overview = movie["overview"]
  rating = movie["vote_average"]
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"

  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
  puts "#{title} has been added"
end

movies_2["results"].each do |movie|
  title = movie["title"]
  overview = movie["overview"]
  rating = movie["vote_average"]
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"

  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
  puts "#{title} has been added"
end
