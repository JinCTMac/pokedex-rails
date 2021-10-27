class AddAbilitiesToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :abilities, :string
  end
end
