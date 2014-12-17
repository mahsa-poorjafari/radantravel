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
    @tour = Tour.find(params[:tour_id])
  end

  # POST /locationtours
  # POST /locationtours.json
  def create
    @locationtour = Locationtour.new(locationtour_params)
    p '-------------modual_ids-------------'
    p @modual_ids = params[:h].split(',').map(&:to_i)
    p '-------------locationtour.hotel_ids-------------'
    p @locationtour.hotel_ids = @modual_ids
    if @locationtour.save
      redirect_to :back
    else
      
    end
  
  end

  # PATCH/PUT /locationtours/1
  # PATCH/PUT /locationtours/1.json
  def update
    
    if @locationtour.update(locationtour_params)
      render :show
    end
  end

  # DELETE /locationtours/1
  # DELETE /locationtours/1.json
  def destroy
    @locationtour.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locationtour
      @locationtour = Locationtour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locationtour_params
      params.require(:locationtour).permit(:hotel_id, :city_id, :tour_id, :price_two_bed, :price_one_bed, :price_kid_and_bed, :price_kid_without_bed, :description, :price_three_bed)
    end
end

