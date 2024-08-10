# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed Movies
movies = [
  { title: "Laila Majnu", genre: "LoveStory" },
  { title: "The Dark Knight", genre: "Action" },
  { title: "Bahubali", genre: "Historical" },
  { title: "Cars", genre: "Animations" },
  { title: "Avengers: Endgame", genre: "Superhero" }
]

movies.each do |movie_data|
  Movie.create!(movie_data)
end

Movie.all.each do |movie|
  5.times do |i|
    Show.create!(
      show_time: DateTime.now + i.days,
      movie: movie
    )
  end
end 

Show.all.each do |show|
  (1..5).each do |row|
    (1..10).each do |number|
      Seat.create!(
        seat_row: row,
        seat_number: number,
        show: show
      )
    end
  end
end

users = [
  { email: "bris@gmail.com", password: "password", name: "Bristina" },
  { email: "user@gmail.com", password: "password", name: "Ji" }
]

users.each do |user_data|
  User.create!(user_data)
end

users = User.all
shows = Show.all
seats = Seat.where(booked: false).sample(5)

Booking.create!(
  number_of_seats: seats.count.to_s,
  user: users.first,
  show: shows.sample,
  seat_ids: seats.pluck(:id)
)

seats.each { |seat| seat.update!(booked: true) }

puts "Seeding completed!"
