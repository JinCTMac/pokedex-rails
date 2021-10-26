# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# requiring poke-api gem
require 'poke-api-v2'

# looping through all the pokemon and creating them, adding them to the DB
for i in 1..890 do
  PokeApi.get(id: i)
  Pokemon.create()
end
