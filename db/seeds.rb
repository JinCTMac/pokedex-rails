# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'
require 'json'

# 0. Cleaning the db
Pokemon.destroy_all

# 1. building a parsing function

def parse_pokemon(pokemon_entry)
  raw_json = URI.open("https://pokeapi.co/api/v2/pokemon/#{pokemon_entry}").read
  JSON.parse(raw_json)
end

# test if parser works i.e. API call returns the JSON we want of the Pokemon

# bulbasaur = parse_pokemon(1)

# # below returns the name of the pokemon as a string
# # name
# p bulbasaur["name"]
# # number
# p bulbasaur["id"]
# # height
# p bulbasaur["height"]
# # weight
# p bulbasaur["weight"]
# # stats
# # returns stats as object
# # 0-HP/1-Atk/2-Def... etc
# p bulbasaur["stats"]
# p bulbasaur["stats"][0]["base_stat"]
# p bulbasaur["stats"][1]["base_stat"]
# p bulbasaur["stats"][2]["base_stat"]
# p bulbasaur["stats"][3]["base_stat"]
# p bulbasaur["stats"][4]["base_stat"]
# p bulbasaur["stats"][5]["base_stat"]
# # types
# p bulbasaur["types"][0]["type"]["name"]
# p bulbasaur["types"][1]["type"]["name"]

# 2. creating Pokemon and putting them into the db
# need to account for some pokemon being monotype

puts "calling api and creating pokemon"

for i in (1..890).to_a do
  pokemon_entry = parse_pokemon(i)
  if pokemon_entry["types"].length > 1
    Pokemon.create(
    name: pokemon_entry["name"],
    number: pokemon_entry["id"],
    height: pokemon_entry["height"],
    weight: pokemon_entry["weight"],
    hp: pokemon_entry["stats"][0]["base_stat"],
    atk: pokemon_entry["stats"][1]["base_stat"],
    def: pokemon_entry["stats"][2]["base_stat"],
    spatk: pokemon_entry["stats"][3]["base_stat"],
    spdef: pokemon_entry["stats"][4]["base_stat"],
    speed: pokemon_entry["stats"][5]["base_stat"],
    type_one: pokemon_entry["types"][0]["type"]["name"],
    type_two: pokemon_entry["types"][1]["type"]["name"]
  )
else
  Pokemon.create(
    name: pokemon_entry["name"],
    number: pokemon_entry["id"],
    height: pokemon_entry["height"],
    weight: pokemon_entry["weight"],
    hp: pokemon_entry["stats"][0]["base_stat"],
    atk: pokemon_entry["stats"][1]["base_stat"],
    def: pokemon_entry["stats"][2]["base_stat"],
    spatk: pokemon_entry["stats"][3]["base_stat"],
    spdef: pokemon_entry["stats"][4]["base_stat"],
    speed: pokemon_entry["stats"][5]["base_stat"],
    type_one: pokemon_entry["types"][0]["type"]["name"]
  )
end

  puts "#{pokemon_entry["name"]} created. There are #{Pokemon.count} Pokemon"
end
