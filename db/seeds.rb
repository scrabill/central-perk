# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create(name: "Gunther", email: "gunther@centralperk.com", password: ENV["PASSWORD"])

# Coffee
MenuItem.create(name: "Coffee", description: "Just coffee. House blend, served hot with room for cream or sugar.", price: 2.80 )
MenuItem.create(name: "Iced Coffee", description: "Cold brew served over ice and blended with sweetened milk.", price: 3.5 )
MenuItem.create(name: "Espresso", description: "Strong, but not bitter. A perfect start to a long day.", price: 3.10 )

# Specialty Coffee
MenuItem.create(name: "Cappuccino", description: "House blend coffee served with steamed and frothed milk.", price: 3.5 )
MenuItem.create(name: "Caffè mocha", description: "Espresso, chocolate and steamed milk topped with cinnamon.", price: 2.5 )
MenuItem.create(name: "Macchiato", description: "Espresso with a dash of frothy steamed milk.", price: 3.75)

# Teas
MenuItem.create(name: "Matcha green tea latte", description: "Matcha tea steeped in steamed milk and lightly sweetened.", price: 3.50)
MenuItem.create(name: " Chai latte", description: "Black tea steeped in spices including cardamon, star anise, cinnamon and cloves.", price: 2.75)
MenuItem.create(name: " Assorted teas", description: "Choose from black tea, chamomile or earl grey", price: 1.75)

# Other
MenuItem.create(name: "Banana", description: "Organic.", price: 1.00 )
MenuItem.create(name: "Scone", description: "Blueberry, lemon with a royal icing drizzle.", price: 2.0 )
MenuItem.create(name: "Biscotti", description: "Twice baked and very crispy. Choose from dark chocolate or salted caramel.", price: 1.50)

# Orders
6.times do
  order = Order.create!(user_id: 1, name_for_pickup: Faker::TvShows::Friends.unique.character, completed: false, menu_item_ids: [Faker::Number.within(range: 1..12), Faker::Number.within(range: 1..12), Faker::Number.within(range: 1..12)])
end

3.times do
  order = Order.create!(user_id: 1, name_for_pickup: Faker::TvShows::Friends.unique.character, completed: true, menu_item_ids: [Faker::Number.within(range: 1..9), Faker::Number.within(range: 10..12)])
end
