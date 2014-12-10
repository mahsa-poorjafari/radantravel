class ClassHotelsController < ApplicationController
  before_action :set_class_hotel, only: [:show, :edit, :update, :destroy]

  # GET /class_hotels
  # GET /class_hotels.json
  def index
    @class_hotels = ClassHotel.all
  end

  # GET /class_hotels/1
  # GET /class_hotels/1.json
  def show
  end

  # GET /class_hotels/new
  def new
    @class_hotel = ClassHotel.new
  end

  # GET /class_hotels/1/edit
  def edit
  end

  # POST /class_hotels
  # POST /class_hotels.json
  def create
    @class_hotel = ClassHotel.new(class_hotel_params)

  
    if @class_hotel.save
      redirect_to :back
    else
      
    end
  
  end

  # PATCH/PUT /class_hotels/1
  # PATCH/PUT /class_hotels/1.json
  def update
    respond_to do |format|
      if @class_hotel.update(class_hotel_params)
        format.html { redirect_to @class_hotel, notice: 'Class hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_hotel }
      else
        format.html { render :edit }
        format.json { render json: @class_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_hotels/1
  # DELETE /class_hotels/1.json
  def destroy
    @class_hotel.destroy
    respond_to do |format|
      format.html { redirect_to class_hotels_url, notice: 'Class hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_hotel
      @class_hotel = ClassHotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_hotel_params
      params.require(:class_hotel).permit(:title)
    end
end
