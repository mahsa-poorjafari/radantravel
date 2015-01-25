class InvestmentInIransController < ApplicationController
  before_action :set_investment_in_iran, only: [:show, :edit, :update, :destroy]

  # GET /investment_in_irans
  # GET /investment_in_irans.json
  def index
    @investment_in_irans = InvestmentInIran.all
  end

  # GET /investment_in_irans/1
  # GET /investment_in_irans/1.json
  def show
  end

  # GET /investment_in_irans/new
  def new
    @investment_in_iran = InvestmentInIran.new
  end

  # GET /investment_in_irans/1/edit
  def edit
  end

  # POST /investment_in_irans
  # POST /investment_in_irans.json
  def create
    @investment_in_iran = InvestmentInIran.new(investment_in_iran_params)

    respond_to do |format|
      if @investment_in_iran.save
        format.html { redirect_to @investment_in_iran, notice: 'Investment in iran was successfully created.' }
        format.json { render :show, status: :created, location: @investment_in_iran }
      else
        format.html { render :new }
        format.json { render json: @investment_in_iran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investment_in_irans/1
  # PATCH/PUT /investment_in_irans/1.json
  def update
    respond_to do |format|
      if @investment_in_iran.update(investment_in_iran_params)
        format.html { redirect_to @investment_in_iran, notice: 'Investment in iran was successfully updated.' }
        format.json { render :show, status: :ok, location: @investment_in_iran }
      else
        format.html { render :edit }
        format.json { render json: @investment_in_iran.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investment_in_irans/1
  # DELETE /investment_in_irans/1.json
  def destroy
    @investment_in_iran.destroy
    respond_to do |format|
      format.html { redirect_to investment_in_irans_url, notice: 'Investment in iran was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment_in_iran
      @investment_in_iran = InvestmentInIran.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_in_iran_params
      params.require(:investment_in_iran).permit(:title_en, :title_fa, :title_ar, :text_en, :text_fa, :text_ar, :image,
      pdf_investments_attributes: [:id, :_destroy, :_update,
      :title_en, :title_fa, :title_ar, :text_en, :text_fa, :text_ar,
      :investment_in_iran_id, :pdf_file])
    end
end
