# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'
require 'json'

# 0. Cleaning the db

# puts "cleaning database"

# Pokemon.destroy_all

# puts "database cleaned"

# calls pokemon from pokeapi https://pokeapi.co/docs/v2#pokemon

# 1. building a parsing function

def parse_pokemon(pokemon_entry)
  raw_json = URI.open("https://pokeapi.co/api/v2/pokemon/#{pokemon_entry}").read
  JSON.parse(raw_json)
end

# bulbasaur = parse_pokemon(1)
# p bulbasaur["moves"]
# p bulbasaur["moves"][0]["move"]["name"]
# p bulbasaur["moves"][0]["version_group_details"][0]["level_learned_at"]
# p bulbasaur["moves"][0]["version_group_details"][0]["move_learn_method"]["name"]

# 1.1 building an image parsing function

# def attach_photo(pokemon)
#   url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon["id"]}.png"
#   file = URI.open(url)
#   pokemon.photo.attach(io: file, filename: "#{pokemon["name"]}.png", content_type: 'image/png')
# end

# 2. creating Pokemon and putting them into the db
# need to account for some pokemon being monotype
# below code works

puts "calling api and creating pokemon"

for i in (1..890).to_a do
  pokemon_entry = parse_pokemon(i)
  if pokemon_entry["types"].length > 1
    pokemon = Pokemon.create(
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
    pokemon = Pokemon.create(
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

  url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{pokemon["id"]}.png"
  file = URI.open(url)
  pokemon.photo.attach(io: file, filename: "#{pokemon["name"]}.png", content_type: 'image/png')

  puts "#{pokemon_entry["name"]} created. There are #{Pokemon.count} Pokemon"
end
