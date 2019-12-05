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
