class PokemonsController < ApplicationController
  # Had to call it Pokemons controller to be consistent with Rails convention :sadge:
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find[params[:id]]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
