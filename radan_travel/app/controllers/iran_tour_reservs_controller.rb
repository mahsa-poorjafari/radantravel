class IranTourReservsController < ApplicationController
  before_action :set_iran_tour_reserv, only: [:show, :edit, :update, :destroy]

  # GET /iran_tour_reservs
  # GET /iran_tour_reservs.json
  def index
    @iran_tour_reservs = IranTourReserv.all
  end

  # GET /iran_tour_reservs/1
  # GET /iran_tour_reservs/1.json
  def show
    @iran_tour_reserv.update_attribute(:visited, true)
  end

  # GET /iran_tour_reservs/new
  def new
    @iran_tour_reserv = IranTourReserv.new
  end

  # GET /iran_tour_reservs/1/edit
  def edit
  end

  # POST /iran_tour_reservs
  # POST /iran_tour_reservs.json
  def create
    @iran_tour_reserv = IranTourReserv.new(iran_tour_reserv_params)    
    @tracking_code = Devise.friendly_token.first(10)
    @iran_tour_reserv.track_code = @tracking_code
    
    if @iran_tour_reserv.save
      flash[:reservdone] = 'Your Reserve was successfully done. This is Your Tracking Code '
      flash[:trackingcode] = @tracking_code
      redirect_to :back      
    else
      flash[:reservError] =  'Please Fill The Necessary Fields'
      redirect_to :back      
    end
    
  end

  # PATCH/PUT /iran_tour_reservs/1
  # PATCH/PUT /iran_tour_reservs/1.json
  def update
    respond_to do |format|
      if @iran_tour_reserv.update(iran_tour_reserv_params)
        format.html { redirect_to @iran_tour_reserv, notice: 'Iran tour reserv was successfully updated.' }
        format.json { render :show, status: :ok, location: @iran_tour_reserv }
      else
        format.html { render :edit }
        format.json { render json: @iran_tour_reserv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iran_tour_reservs/1
  # DELETE /iran_tour_reservs/1.json
  def destroy
    @iran_tour_reserv.destroy
    respond_to do |format|
      format.html { redirect_to iran_tour_reservs_url, notice: 'Iran tour reserv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iran_tour_reserv
      @iran_tour_reserv = IranTourReserv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iran_tour_reserv_params
      params.require(:iran_tour_reserv).permit(:fisrt_name, :last_name, :phone_number, :email, 
        :mobile, :fax, :start_date, :date_flexible, :adults_no, :children_no, :infants_no, :remarks,
        :tour_id, :track_code)
    end
end
