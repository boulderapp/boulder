class VillagesController < ApplicationController
  before_action :set_campaign
  before_action :set_village, only: %i[ show edit update destroy ]

  # GET /villages or /villages.json
  def index
    @villages = Village.all
  end

  # GET /villages/1 or /villages/1.json
  def show
  end

  # GET /villages/new
  def new
    @village = Village.new
  end

  # GET /villages/1/edit
  def edit
  end

  # POST /villages or /villages.json
  def create
    @village = Village.new(village_params)
    @village.campaign = @campaign

    respond_to do |format|
      if @village.save
        format.html { redirect_to campaign_village_url(@campaign, @village), notice: "Village was successfully created." }
        format.json { render :show, status: :created, location: @village }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @village.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villages/1 or /villages/1.json
  def update
    respond_to do |format|
      if @village.update(village_params)
        format.html { redirect_to campaign_village_url(@campaign, @village), notice: "Village was successfully updated." }
        format.json { render :show, status: :ok, location: @village }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @village.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villages/1 or /villages/1.json
  def destroy
    @village.destroy

    respond_to do |format|
      format.html { redirect_to campaign_villages_url(@campaign), notice: "Village was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village
      @village = Village.find(params[:id])
    end

    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    # Only allow a list of trusted parameters through.
    def village_params
      params.require(:village).permit(:name)
    end
end
