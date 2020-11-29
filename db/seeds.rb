# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "trainer", email: "test@test.com", password: "pass")

Rider.create(name: "Jenny Hannon", user_id: 1)
Rider.create(name: "Katie Strandberg", user_id: 1)
Rider.create(name: "Jane Fischer", user_id: 1)

Horse.create(name: "Olympic Fire", owner: "Ocean Echo Farm", user_id: 1)
Horse.create(name: "Mindful", owner: "Selma Garber", user_id: 1)
Horse.create(name: "Corice Z", owner: "Claire Kenna", user_id: 1)
Horse.create(name: "Varsity", owner: "Jane Fischer", user_id: 1)

