class BeersController < ApplicationController

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
    @comment = Comment.new
    @comment.beer_id = @beer.id
    binding.pry
  end

  def new
    @beer = Beer.new
  end


  def create
    @beer = Beer.new(beer_params)

    respond_to do |format|
      if @beer.save
        format.html { redirect_to beers_path, notice: 'Beer was successfully created.' }
        format.json { render :show, status: :created, location: @beer }
      else
        format.html { render :new }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        format.json { render :show, status: :ok, location: @beer }
      else
        format.html { render :edit }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    beer = @beer.find(params[:id])
    beer.destroy
    respond_to do |format|
      format.html { redirect_to beers_url, notice: 'Beer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :style)
    end
end
