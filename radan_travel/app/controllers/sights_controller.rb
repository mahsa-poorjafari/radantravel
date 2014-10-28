class SightsController < ApplicationController
  before_action :set_sight, only: [:show, :edit, :update, :destroy]

  # GET /sights
  # GET /sights.json
  def index
    @sights = Sight.all
  end

  # GET /sights/1
  # GET /sights/1.json
  def show
  end

  # GET /sights/new
  def new
    @sight = Sight.new
  end

  # GET /sights/1/edit
  def edit
  end

  # POST /sights
  # POST /sights.json
  def create
    @sight = Sight.new(sight_params)

    respond_to do |format|
      if @sight.save
        format.html { redirect_to @sight, notice: 'Sight was successfully created.' }
        format.json { render :show, status: :created, location: @sight }
      else
        format.html { render :new }
        format.json { render json: @sight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sights/1
  # PATCH/PUT /sights/1.json
  def update
    respond_to do |format|
      if @sight.update(sight_params)
        format.html { redirect_to @sight, notice: 'Sight was successfully updated.' }
        format.json { render :show, status: :ok, location: @sight }
      else
        format.html { render :edit }
        format.json { render json: @sight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sights/1
  # DELETE /sights/1.json
  def destroy
    @sight.destroy
    respond_to do |format|
      format.html { redirect_to sights_url, notice: 'Sight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sight
      @sight = Sight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sight_params
      params.require(:sight).permit(:title_fa, :title_en, :title_ar, :text_fa, :text_en, :text_ar,
      :country_id, :city_id  )
    end
end
