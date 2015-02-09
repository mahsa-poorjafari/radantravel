class CategoryCountriesController < ApplicationController
  before_action :set_category_country, only: [:show, :edit, :update, :destroy]

  # GET /category_countries
  # GET /category_countries.json
  def index
    @category_countries = CategoryCountry.all
  end

  # GET /category_countries/1
  # GET /category_countries/1.json
  def show  
    p '------------continent_id--------------'
    p @continent = params[:continent_id]
    @continent_category = ContinentCategory.find(@continent)
  end

  # GET /category_countries/new
  def new
    @category_country = CategoryCountry.new
  end

  # GET /category_countries/1/edit
  def edit
  end

  # POST /category_countries
  # POST /category_countries.json
  def create
    @category_country = CategoryCountry.new(category_country_params)

    respond_to do |format|
      if @category_country.save
        format.html { redirect_to @category_country, notice: 'Category country was successfully created.' }
        format.json { render :show, status: :created, location: @category_country }
      else
        format.html { render :new }
        format.json { render json: @category_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_countries/1
  # PATCH/PUT /category_countries/1.json
  def update
    respond_to do |format|
      if @category_country.update(category_country_params)
        format.html { redirect_to @category_country, notice: 'Category country was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_country }
      else
        format.html { render :edit }
        format.json { render json: @category_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_countries/1
  # DELETE /category_countries/1.json
  def destroy
    @category_country.destroy
    respond_to do |format|
      format.html { redirect_to category_countries_url, notice: 'Category country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_country
      @category_country = CategoryCountry.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_country_params
      params.require(:category_country).permit(:title_en, :title_fa, :title_ar)
    end
end
