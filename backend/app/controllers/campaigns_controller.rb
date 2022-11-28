class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[ show edit update destroy ]

  # GET /campaigns or /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
  end

  # POST /campaigns or /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.owner = current_user

    if @campaign.save
      render :show, status: :created, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /campaigns/1 or /campaigns/1.json
  def update
    if @campaign.update(campaign_params)
      render :show, status: :ok, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1 or /campaigns/1.json
  def destroy
    @campaign.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.require(:campaign).permit(:name)
    end
end
