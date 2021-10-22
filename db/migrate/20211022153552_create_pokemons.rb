class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :number
      t.text :entry
      t.integer :height
      t.integer :weight
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :spatk
      t.integer :spdef
      t.integer :speed
      t.string :type_one
      t.string :type_two

      t.timestamps
    end
  end
end
