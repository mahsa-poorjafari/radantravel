# encoding: UTF-8
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
    p @city = City.where( country_id: country_id).order(" created_at desc")
    respond_to do |format|
      format.js
    end
  end
  def dynamic_hotel 
    p '--------city_id -----------'
    p @city_id = params[:city_id]
    p @city = City.find(@city_id)
    p '=======city hotel========'
    p @hotels = Hotel.where(city_id: @city).order(" created_at desc")
  end
  # GET /locationtours/new
  def new
    @locationtour = Locationtour.new
    @tour = Tour.find(params[:tour_id])
    @@tour1 = @tour
  end

  # GET /locationtours/1/edit
  def edit
    @tour = Tour.find(params[:tour_id])
    flash[:EditDone] = 'ویرایش اطلاعات انجام شد.'
  end

  # POST /locationtours
  # POST /locationtours.json
  def create
    @locationtour = Locationtour.new(locationtour_params)
    p '-------------modual_ids-------------'
    p @modual_ids = params[:h].split(',').map(&:to_i)
    p '-------------locationtour.hotel_ids-------------'
    p @locationtour.hotel_ids = @modual_ids
    respond_to do |format|
      if @locationtour.save  
        format.html do
          flash[:AddLoc] =  'عضو جدید با موفقیت ثبت گردید.'         
          redirect_to :back
        end

      else
        flash[:error] = 'خطا در ثبت اطلاعات رخ داده است'        
        @tour = @@tour1
        format.html { render :new }
      end        
    end
    
  
  end

  # PATCH/PUT /locationtours/1
  # PATCH/PUT /locationtours/1.json
  def update
    
    if @locationtour.update(locationtour_params)
      redirect_to tour_url(:id => @@tour1.id)
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
      params.require(:locationtour).permit(:hotel_id, :city_id, :tour_id, :price_two_bed, :price_one_bed, :price_kid_and_bed, :price_kid_without_bed, :description, :price_three_bed, :custom_hotel)
    end
end


