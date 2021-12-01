class PokemonController < ApplicationController
  # Had to call it Pokemons controller to be consistent with Rails convention :sadge:
  def index
    # index page for all Pokemon - should be a long list just like on Smogon/bulbapedia
    @pokemons = Pokemon.all
  end

  def show
    # show page for a specific Pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    # build new instance of Pokemon (not that you would ever need to)
    @pokemon = Pokemon.new
  end

  def create
    # don't know why would need this unless a new pokemon gets released or you want to make a new one
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.save
  end

  def edit
    # don't need
  end

  def update
    # don't need
  end

  def destroy
    # don't need
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :number, :entry, :height, :weight, :hp, :atk, :def, :spatk, :spdef, :speed, :type_one, :type_two, :abilities, :photo)
  end
end
