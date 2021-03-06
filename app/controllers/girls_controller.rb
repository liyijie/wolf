class GirlsController < ApplicationController
  before_action :set_girl, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!

  # GET /girls
  # GET /girls.json
  def index
    @girls = Girl.avaliables.page(params[:page])
    @advertisements = Advertisement.all
  end

  # GET /girls/1
  # GET /girls/1.json
  def show
    @girl.fit current_user
    @advertisement = Advertisement.last
  end

  # GET /girls/new
  def new
    @girl = Girl.new
  end

  # GET /girls/1/edit
  def edit
  end

  # POST /girls
  # POST /girls.json
  def create
    @girl = Girl.new(girl_params)

    respond_to do |format|
      if @girl.save
        format.html { redirect_to @girl, notice: 'Girl was successfully created.' }
        format.json { render action: 'show', status: :created, location: @girl }
      else
        format.html { render action: 'new' }
        format.json { render json: @girl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /girls/1
  # PATCH/PUT /girls/1.json
  def update
    respond_to do |format|
      if @girl.update(girl_params)
        format.html { redirect_to @girl, notice: 'Girl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @girl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /girls/1
  # DELETE /girls/1.json
  def destroy
    @girl.destroy
    respond_to do |format|
      format.html { redirect_to girls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_girl
      @girl = Girl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def girl_params
      params.require(:girl).permit(:qq, :city, :birth, :height, :weight, :grade_id, :age_min, :age_max, :height_min, :height_max, :weight_min, :weight_max, :comment)
    end
end
