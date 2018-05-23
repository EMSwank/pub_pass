class BreweriesController < ApplicationController

  def index
    @breweries = Brewery.all
  end

  def show
  end

  def new
    @brewery = Brewery.new
  end

  def edit
  end


  private

    def brewery_params
      params.require(:brewery).permit(:name, :location)
    end
end
