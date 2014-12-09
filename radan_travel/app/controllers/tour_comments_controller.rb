# encoding: UTF-8
class TourCommentsController < ApplicationController
  before_action :set_tour_comment, only: [:show, :edit, :update, :destroy, :confirm]

  # GET /tour_comments
  # GET /tour_comments.json
  def index
    @tour_comments = TourComment.order(" created_at desc")
  end

  # GET /tour_comments/1
  # GET /tour_comments/1.json
  def show
  end
  def dynamic_city
    p '...................'
    p  country_id = params[:country_list]
    p @city = City.where( country_id: country_id)
    p '...................'
  end

  # GET /tour_comments/new
  def new
    @tour_comment = TourComment.new
  end

  # GET /tour_comments/1/edit
  def edit
  end
  def confirm   
    @tour_comment.update_attribute(:confirm_comment, true)
    redirect_to :back
  end

  # POST /tour_comments
  # POST /tour_comments.json
  def create
    @tour_comment = TourComment.new(tour_comment_params)  
    if @tour_comment.save
      @customer = Customer.new(email: @tour_comment.user_email, name: @tour_comment.user_name )
      @customer.save!
      flash[:SendComment] = 'کاربر گرامی نظر شما ثبت شد. پس از تایید مدیر در سایت نمایش داده خواهد شد.'
      redirect_to :back
    end
    
  end

  # PATCH/PUT /tour_comments/1
  # PATCH/PUT /tour_comments/1.json
  def update
    respond_to do |format|
      if @tour_comment.update(tour_comment_params)
        format.html { redirect_to @tour_comment, notice: 'Tour comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_comment }
      else
        format.html { render :edit }
        format.json { render json: @tour_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_comments/1
  # DELETE /tour_comments/1.json
  def destroy
    @tour_comment.destroy
    respond_to do |format|
      format.html { redirect_to tour_comments_url, notice: 'Tour comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_comment
      @tour_comment = TourComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_comment_params
      params.require(:tour_comment).permit(:user_name, :tour_id, :text, :confirm_comment, :user_email)
    end
end
