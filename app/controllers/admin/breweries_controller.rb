class Admin::BreweriesController < Admin::BaseController

  def index
    @breweries = Brewery.all
  end

  def new
    @brewery = Brewery.new
  end

  def edit
    @brewery = Brewery.find(params[:id])
    @breweries = Brewery.all
  end

  def create
    @brewery = Brewery.new(brewery_params)

    respond_to do |format|
      if @brewery.save
        format.html { redirect_to breweries_path, notice: 'Brewery was successfully created.' }
        format.json { render :show, status: :created, location: @brewery }
      else
        format.html { render :new }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @brewery = Brewery.find(params[:id])
    respond_to do |format|
      if @brewery.update(brewery_params)
        format.html { redirect_to @brewery, notice: 'Brewery was successfully updated.' }
        format.json { render :show, status: :ok, location: @brewery }
      else
        format.html { render :edit }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    brewery = Brewery.find(params[:id])
    brewery.destroy
    respond_to do |format|
      format.html { redirect_to breweries_url, notice: 'Brewery was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def brewery_params
      params.require(:brewery).permit(:name, :location)
    end
end
