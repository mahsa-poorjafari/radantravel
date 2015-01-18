class ContinentCategoriesController < ApplicationController
  before_action :set_continent_category, only: [:show, :edit, :update, :destroy]

  # GET /continent_categories
  # GET /continent_categories.json
  def index
    @continent_categories = ContinentCategory.all
  end

  # GET /continent_categories/1
  # GET /continent_categories/1.json
  def show
  end

  # GET /continent_categories/new
  def new
    @continent_category = ContinentCategory.new
  end

  # GET /continent_categories/1/edit
  def edit
  end

  # POST /continent_categories
  # POST /continent_categories.json
  def create
    @continent_category = ContinentCategory.new(continent_category_params)

    respond_to do |format|
      if @continent_category.save
        format.html { redirect_to @continent_category, notice: 'Continent category was successfully created.' }
        format.json { render :show, status: :created, location: @continent_category }
      else
        format.html { render :new }
        format.json { render json: @continent_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /continent_categories/1
  # PATCH/PUT /continent_categories/1.json
  def update
    respond_to do |format|
      if @continent_category.update(continent_category_params)
        format.html { redirect_to @continent_category, notice: 'Continent category was successfully updated.' }
        format.json { render :show, status: :ok, location: @continent_category }
      else
        format.html { render :edit }
        format.json { render json: @continent_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /continent_categories/1
  # DELETE /continent_categories/1.json
  def destroy
    @continent_category.destroy
    respond_to do |format|
      format.html { redirect_to continent_categories_url, notice: 'Continent category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_continent_category
      @continent_category = ContinentCategory.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def continent_category_params
      params.require(:continent_category).permit(:title_fa, :title_en, :title_ar, :icon, :set_order)
    end
end
