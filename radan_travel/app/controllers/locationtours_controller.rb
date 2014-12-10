class LocationtoursController < ApplicationController
  before_action :set_locationtour, only: [:show, :edit, :update, :destroy]

  # GET /locationtours
  # GET /locationtours.json
  def index
    @locationtours = Locationtour.all
  end

  # GET /locationtours/1
  # GET /locationtours/1.json
  def show
  end
  def dynamic_city
    p country_id = params[:country_list]
    p @city = City.where( country_id: country_id)
  end
  def dynamic_hotel 
    p '--------city_id -----------'
    p @city_id = params[:city_id]
    p @city = City.find(@city_id)
    p '=======city hotel========'
    p @hotels = Hotel.where(city_id: @city)
  end
  # GET /locationtours/new
  def new
    @locationtour = Locationtour.new
    @tour = Tour.find(params[:tour_id])
  end

  # GET /locationtours/1/edit
  def edit
  end

  # POST /locationtours
  # POST /locationtours.json
  def create
    @locationtour = Locationtour.new(locationtour_params)
    
    if @locationtour.save
      redirect_to :back
    else
      
    end
  
  end

  # PATCH/PUT /locationtours/1
  # PATCH/PUT /locationtours/1.json
  def update
    respond_to do |format|
      if @locationtour.update(locationtour_params)
        format.html { redirect_to @locationtour, notice: 'Locationtour was successfully updated.' }
        format.json { render :show, status: :ok, location: @locationtour }
      else
        format.html { render :edit }
        format.json { render json: @locationtour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locationtours/1
  # DELETE /locationtours/1.json
  def destroy
    @locationtour.destroy
    respond_to do |format|
      format.html { redirect_to locationtours_url, notice: 'Locationtour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locationtour
      @locationtour = Locationtour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locationtour_params
      params.require(:locationtour).permit(:hotel_id, :city_id, :tour_id, :price_two_bed, :price_one_bed, :price_kid_and_bed, :price_kid_without_bed)
    end
end
