class BeersController < ApplicationController
  def index
    @beers = Beer.in_use
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def create
    new_beer = Beer.new(beer_params)

    if new_beer.save
      redirect_to beers_path
      flash[:success] = 'Beer successfully added'
    else
      redirect_to new_beer_path
      flash[:error] = "Error: #{error_message(new_beer.errors)}"
    end
  end
  
  def edit
    @beer = Beer.find(params[:id])
  end
  
  def update
    beer = Beer.find(params[:id])
    
    if beer.update(beer_params)
      redirect_to beer_path(beer)
      flash[:success] = 'Beer successfully updated'
    else
      redirect_to edit_beer_path(beer)
      flash[:error] = "Error: #{error_message(beer.errors)}"
    end
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :inventory)
  end
end