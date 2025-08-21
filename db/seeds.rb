# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# 1. Clean the database 🗑️
puts "Cleaning database..."
Movie.destroy_all
Bookmark.destroy_all
List.destroy_all

# 2. Seed movies🏗️
puts "Creating movies..."


movie = Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
puts "Created #{movie.title}"
movie = Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
puts "Created #{movie.title}"
movie = Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
puts "Created #{movie.title}"
movie = Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

puts "Finished! Created #{Movie.count} movies."

# 3. Seed lists
puts "Creating lists..."
my_favorites = List.create!(name: "My Favorite Movies")
puts "Created list: #{my_favorites.name}"

# 4. Seed bookmarks (link movies to list)
puts "Creating bookmarks..."
Bookmark.create!(movie: wonder_woman, list: my_favorites, comment: "Awesome movie!")
Bookmark.create!(movie: shawshank, list: my_favorites, comment: "Classic!")
puts "Created #{Bookmark.count} bookmarks."
