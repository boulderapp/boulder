class VillagesController < ApplicationController
  before_action :set_campaign
  before_action :set_village, only: %i[ show edit update destroy ]

  # GET /villages or /villages.json
  def index
    @villages = Village.all
  end

  # GET /villages/new
  def new
    @village = Village.new
  end

  # POST /villages or /villages.json
  def create
    @village = Village.new(village_params)
    @village.campaign = @campaign

    if @village.save
      render :show, status: :created, location: [@campaign, @village]
    else
      render json: @village.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /villages/1 or /villages/1.json
  def update
    if @village.update(village_params)
      render :show, status: :ok, location: [@campaign, @village]
    else
      render json: @village.errors, status: :unprocessable_entity
    end
  end

  # DELETE /villages/1 or /villages/1.json
  def destroy
    @village.destroy

    head :no_content 
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
