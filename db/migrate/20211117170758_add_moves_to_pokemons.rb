class AddMovesToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :moves, :string
  end
end
