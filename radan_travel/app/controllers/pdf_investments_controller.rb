class PdfInvestmentsController < ApplicationController
  before_action :set_pdf_investment, only: [:show, :edit, :update, :destroy]

  # GET /pdf_investments
  # GET /pdf_investments.json
  def index
    @pdf_investments = PdfInvestment.all
  end

  # GET /pdf_investments/1
  # GET /pdf_investments/1.json
  def show
  end

  # GET /pdf_investments/new
  def new
    @pdf_investment = PdfInvestment.new
  end

  # GET /pdf_investments/1/edit
  def edit
  end

  # POST /pdf_investments
  # POST /pdf_investments.json
  def create
    @pdf_investment = PdfInvestment.new(pdf_investment_params)

    respond_to do |format|
      if @pdf_investment.save
        format.html { redirect_to @pdf_investment, notice: 'Pdf investment was successfully created.' }
        format.json { render :show, status: :created, location: @pdf_investment }
      else
        format.html { render :new }
        format.json { render json: @pdf_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pdf_investments/1
  # PATCH/PUT /pdf_investments/1.json
  def update
    respond_to do |format|
      if @pdf_investment.update(pdf_investment_params)
        format.html { redirect_to @pdf_investment, notice: 'Pdf investment was successfully updated.' }
        format.json { render :show, status: :ok, location: @pdf_investment }
      else
        format.html { render :edit }
        format.json { render json: @pdf_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_investments/1
  # DELETE /pdf_investments/1.json
  def destroy
    @pdf_investment.destroy
    respond_to do |format|
      format.html { redirect_to pdf_investments_url, notice: 'Pdf investment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf_investment
      @pdf_investment = PdfInvestment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pdf_investment_params
      params.require(:pdf_investment).permit(:title_en, :title_fa, :title_ar, :text_en, :text_fa, :text_ar,
       :investment_in_iran_id, :pdf_file)
    end
end
