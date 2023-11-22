# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Event.destroy_all
Category.destroy_all
User.destroy_all
# Creating 5 Users
5.times do |i|
  User.create!(
    email: "user#{i+1}@example.com",
    password: "password",
    username: "user#{i+1}"
  )
end

# Creating Categories
categories = ["Sport", "Hiking", "Music", "Party", "Travel"]
categories.each do |category|
  Category.create!(name: category)
end

# Event names organized by category
event_names = {
  "Sport" => ["City Marathon", "Amateur Football League", "Swimming Gala", "Table Tennis Championship"],
  "Hiking" => ["Mountain Trail Challenge", "Nature Walk Expedition", "Sunrise Peak Hike", "Forest Adventure Trek"],
  "Music" => ["Jazz Night Live", "Rock Concert Series", "Classical Music Evening", "Pop Music Festival"],
  "Party" => ["Costume Party Bash", "Summer Beach Party", "New Year's Eve Celebration", "Dance Night Extravaganza"],
  "Travel" => ["Cultural Exchange Tour", "Weekend Getaway", "Historical Sites Trip", "Island Exploration Journey"]
}

def generate_dates
  start_date = Date.new(2023, rand(11..12), rand(1..30))
  end_date = Date.new(2023, start_date.month, start_date.day + rand(0..2))
  [start_date, end_date]
end

# Helper method to generate a random event description
def generate_event_description
  "This is a description for the event. " * 10 # Adjust as needed to reach about 300 chars
end

# Helper method to generate a random address (you can customize this as needed)
def generate_address
  "Passeig de Gracia #{rand(1..100)}, Barcelona, Spain"
end

# Creating Events for each category
Category.find_each do |category|
  event_names[category.name].each do |event_name|
    dates = generate_dates
    # puts "start date: #{dates[0]} end date: #{dates[1]}"
    event = Event.new(
      name: event_name,
      description: generate_event_description,
      address: generate_address,
      user: User.order("RANDOM()").first, # Randomly assign a user
      start_date: dates[0],
      end_date: dates[1]
    )

    # Associating event with category
    EventCategory.create!(
      event: event,
      category: category
    )
  end
end
