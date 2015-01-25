# encoding: UTF-8
class VisaFormsController < ApplicationController
  before_action :set_visa_form, only: [:show, :edit, :update, :destroy]

  # GET /visa_forms
  # GET /visa_forms.json
  def index
    @visa_forms = VisaForm.all
  end

  # GET /visa_forms/1
  # GET /visa_forms/1.json
  def show
    @visa_form.update_attribute(:admin_visited, true)
  end

  # GET /visa_forms/new
  def new
    @visa_form = VisaForm.new
  end

  # GET /visa_forms/1/edit
  def edit
  end

  # POST /visa_forms
  # POST /visa_forms.json
  def create
    @visa_form = VisaForm.new(visa_form_params)
    @tracking_code = Devise.friendly_token.first(10)
    @visa_form.request_code = @tracking_code
  
    if @visa_form.save
      flash[:CodeSend] = 'کاربر گرامی کدرهگیری به ایمیل شما ارسال گردید.' 
      render action: 'show'
    
    else
      render action: 'new'
    end  
    
    
  end

  # PATCH/PUT /visa_forms/1
  # PATCH/PUT /visa_forms/1.json
  def update
    respond_to do |format|
      if @visa_form.update(visa_form_params)
        format.html { redirect_to @visa_form, notice: 'Visa form was successfully updated.' }
        format.json { render :show, status: :ok, location: @visa_form }
      else
        format.html { render :edit }
        format.json { render json: @visa_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visa_forms/1
  # DELETE /visa_forms/1.json
  def destroy
    @visa_form.destroy
    respond_to do |format|
      format.html { redirect_to visa_forms_url, notice: 'Visa form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visa_form
      @visa_form = VisaForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visa_form_params
      params.require(:visa_form).permit(:request_code, :visa_agreement, :important_notes, :I_agree,  
        :Incoming_Flight_Departure_Airport, :Incoming_Flight_No, :Arrival_date, :Arrival_City, 
        :Outgoing_Fligh_Destination, :Outgoing_Flight_No, :Departure_date, :Departure_City, :admin_visited,
        passengers_attributes: [:id, :_destroy, :_update,
          :First_Name, :Last_Name, :gender, :Marital_status, :Date_of_Birth, 
          :Birth_Place, :Birth_other_Place, :Fathers_Name, :Grand_Fathers_Name, :Occupation, :Job_title, 
          :Your_Company, :Nationality, :Previous_Nationality, :Passport_No, :Passport_type, :Date_Of_Passport_Issue,
          :Place_Of_Passport_Issue, :Date_Of_Passport_Expiry, :Where_collect_your_visa, :Phone_No, :Email, 
          :Duration_Of_Stay_In_Iran, :Travel_Entrance_To_Iran, :Times_Have_You_Been_To_Iran, 
          :date_of_Your_Last_Visit_To_Iran, :visa_form_id ])
    end
end
