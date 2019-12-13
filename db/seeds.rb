# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
banana = MenuItem.create(name: "Banana", description: "Organic and fair trade", price: 1)
coffee = MenuItem.create(name: "Coffee", description: "Dark roast", price: 5)
scone = MenuItem.create(name: "Scone", description: "Blueberry Lemon", price: 3)

# Coffee
6.times do
  MenuItem.create(name: Faker::Coffee.unique.blend_name, description: Faker::Coffee.unique.origin + Faker::Coffee.notes)
end

# Specialty Coffee
MenuItem.create(name: "Cappuccino", description: "House blend coffee served with steamed and frothed milk.", price: 3.5 )
MenuItem.create(name: "Caffè mocha", description: "Espresso, chocolate and steamed milk topped with cinnamon.", price: 2.5 )
MenuItem.create(name: "Macchiato", description: "Espresso with a dash of frothy steamed milk.", price: 3.75)

# Teas
MenuItem.create(name: "Matcha green tea latte", description: "Matcha tea steeped in steamed milk and lightly sweetened.", price: 3.50)
MenuItem.create(name: " Chai latte", description: "Black tea steeped in spices including cardamon, star anise, cinnamon and cloves.", price: 2.75)
MenuItem.create(name: " Assorted teas", description: "Choose from black tea, chamomile or earl grey", price: 1.75)
