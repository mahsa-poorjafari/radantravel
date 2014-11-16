# encoding: UTF-8
class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy, :sendtonewsletter]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all
    p '===================='
    p @send_tour = params[:send_tour]
    p '===================='
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
  end
  def sendtonewsletter    
    UserMailer.send_tour_info_to_newsletter(@tour).deliver 
    p '-------------'
    p @send_tour = @tour.id
    p '-------------'
    flash[:SendTN] = 'اطلاعات برای اعضا خبرنامه ارسال شد.'
    redirect_to action: 'index', :send_tour => @send_tour
  end
  
  def search
    p country = params[:country]
   
    price = params[:price]
    p '-----------'
    p start_date = params[:start_date]
    p Date.today.strftime("%Y/%m/%d")
    p start_date = Persian_to_english_date(start_date)
    if start_date
      p start_date.strftime("%Y/%m/%d")
    end
    p '==============='
    p exp_date = params[:exp_date]
    p exp_date = Persian_to_english_date(exp_date)
    if exp_date
      p exp_date = exp_date.strftime("%Y/%m/%d")
    end
    if country || price || start_date || exp_date      
      @tour_result = Tour.by_country(country).by_price(price).by_start_date(start_date).by_exp_date(exp_date)
      
    end    
  end
  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:title_fa, :title_en, :title_ar, :description_fa, :description_en, :description_ar,
      :plane_id, :hotel_id, :country_id, :city_id,
      :price, :validate_date_from_fa, :validate_date_until_fa, :coming_soon, :itinerary_fa, :itinerary_en, :itinerary_ar,
      :documents_fa, :documents_en, :documents_ar, :decription_image, :info,
      photos_attributes: [:id, :image, :description_fa, :description_en, :description_ar, :tour_id, :_destroy, :_update] )
    end
end
