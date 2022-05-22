class BeersController < ApplicationController
  def index
    @beers = Beer.in_use
  end
end