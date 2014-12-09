# encoding: UTF-8
class CustomToursController < ApplicationController
  before_action :set_custom_tour, only: [:show, :edit, :update, :destroy]

  # GET /custom_tours
  # GET /custom_tours.json
  def index
    @custom_tours = CustomTour.order(" created_at desc")    
  end

  # GET /custom_tours/1
  # GET /custom_tours/1.json
  def show
    @custom_tour.update_attribute(:visited, true)    
  end

  # GET /custom_tours/new
  def new
    @custom_tour = CustomTour.new
  end

  # GET /custom_tours/1/edit
  def edit
  end

  # POST /custom_tours
  # POST /custom_tours.json
  def create
    @custom_tour = CustomTour.new(custom_tour_params)
          
    if @custom_tour.save
      #@customer = Customer.new(email: @custom_tour.user_email, name: @custom_tour.user_name )
      #@customer.save!
      flash[:SendCustomTour] = 'کاربر گرامی پیشنهاد شما ثبت شد.'
      redirect_to :back    
    end
    
  end

  # PATCH/PUT /custom_tours/1
  # PATCH/PUT /custom_tours/1.json
  def update
    respond_to do |format|
      if @custom_tour.update(custom_tour_params)
        format.html { redirect_to @custom_tour, notice: 'Custom tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_tour }
      else
        format.html { render :edit }
        format.json { render json: @custom_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_tours/1
  # DELETE /custom_tours/1.json
  def destroy
    @custom_tour.destroy
    respond_to do |format|
      format.html { redirect_to custom_tours_url, notice: 'Custom tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_tour
      @custom_tour = CustomTour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_tour_params
      params.require(:custom_tour).permit(:user_name, :user_email, :country, :description, :visited)
    end
end
