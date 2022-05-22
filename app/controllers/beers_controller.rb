class BeersController < ApplicationController
  def index
    @beers = Beer.in_use
  end

  def new
    @beer = Beer.new
  end

  def create
    
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :inventory)
  end
end