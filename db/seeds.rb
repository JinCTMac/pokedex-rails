# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'
require 'json'

# building a parsing function

def parse_pokemon(pokemon_entry)
  raw_json = URI.open("https://pokeapi.co/api/v2/pokemon/#{pokemon_entry}").read
  JSON.parse(raw_json)
end

# test if parser works i.e. API call returns the JSON we want of the Pokemon

bulbasaur = parse_pokemon(1)

# below returns the name of the pokemon as a string
p bulbasaur["forms"][0]["name"]


# for i in 1..890 do
#   pokemon_data = PokeApi.get(id: i)
#   Pokemon.create(name: pokemon_data.name,
#   number: pokemon_data.id,
#   height: pokemon_data.height,
#   weight: pokemon_data.weight,
#   hp: pokemon_data.stats[0,
#   atk: pokemon_data.stats.attack,
#   def: pokemon_data.stats.defense,
#   spatk: pokemon_data.stats.{"special-attack"},
#   spdef: pokemon_data.stats.{"special-defense"},
#   speed: pokemon_data.stats.speed,
#   type_one: pokemon_data.types[0].type.name,
#   type_two: pokemon_data.types[0].type.name
# end
