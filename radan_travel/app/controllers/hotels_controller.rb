# encoding: UTF-8
class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
  end
  def dynamic_city
    p '...................'
    p  country_id = params[:country_list]
    p @city = City.where( country_id: country_id)
    p '...................'
  end
  def dynamic_hotel
  end
  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit(:title_fa, :title_en, :title_ar, :text_fa, :text_en, :text_ar, :city_id, :class_hotel_id, :hotel_facilities, :hotel_type,
      photos_attributes: [:id, :image, :description_fa, :description_en, :description_ar, :hotel_id, :_destroy, :_update] 
      )
    end
end
