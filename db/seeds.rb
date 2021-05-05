# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: 'Technology', priority: 0)
Category.create(name: 'Books', priority: 1)
Category.create(name: 'History', priority: 2)
Category.create(name: 'News', priority: 3)