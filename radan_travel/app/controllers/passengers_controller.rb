class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]

  # GET /passengers
  # GET /passengers.json
  def index
    @passengers = Passenger.all
  end

  # GET /passengers/1
  # GET /passengers/1.json
  def show
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers
  # POST /passengers.json
  def create
    @passenger = Passenger.new(passenger_params)

    respond_to do |format|
      if @passenger.save
        format.html { redirect_to @passenger, notice: 'Passenger was successfully created.' }
        format.json { render :show, status: :created, location: @passenger }
      else
        format.html { render :new }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passengers/1
  # PATCH/PUT /passengers/1.json
  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to @passenger, notice: 'Passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1
  # DELETE /passengers/1.json
  def destroy
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to passengers_url, notice: 'Passenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passenger_params
      params.require(:passenger).permit(:First_Name, :Last_Name, :gender, :Marital_status, :Date_of_Birth, 
        :Birth_Place, :Birth_other_Place, :Fathers_Name, :Grand_Fathers_Name, :Occupation, :Job_title, 
        :Your_Company, :Nationality, :Previous_Nationality, :Passport_No, :Passport_type, :Date_Of_Passport_Issue,
        :Place_Of_Passport_Issue, :Date_Of_Passport_Expiry, :Where_collect_your_visa, :Phone_No, :Email, 
        :Duration_Of_Stay_In_Iran, :Travel_Entrance_To_Iran, :Times_Have_You_Been_To_Iran, 
        :date_of_Your_Last_Visit_To_Iran, :visa_form_id)
    end
end
