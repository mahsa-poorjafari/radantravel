# encoding: UTF-8
class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.order(" created_at desc")
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end
  def send_email_to_all    
    subject = params[:subject]    
    text = params[:text]
    UserMailer.email_to_all_customer(subject, text).deliver
    flash[:ToAll] = 'پیام برای تمام اعضا خبرنامه ارسال شد'
    
    redirect_to :back
  end
  def search    
    customer_name = params[:name]
    if customer_name
      @customer_search_result = Customer.seach_in_club(customer_name)
    end
  end
  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      UserMailer.customer_register_done.deliver
      flash[:Ncustomer] = 'کاربر گرامی شما عضو خبرنامه شدید.'
    else
      flash[:Ecustomer] = 'کاربر گرامی ایمیل را صحیح وارد کنید.'
    end
    redirect_to :back
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :phone, :address, :image)
    end
end
