class CharactersController < ApplicationController
  before_action :set_campaign
  before_action :set_character, only: %i[ show edit update destroy ]

  # GET /characters or /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1 or /characters/1.json
  def show
  end

  # POST /characters or /characters.json
  def create
    @character = Character.new(character_params)
    @character.campaign = @campaign

    if @character.save
      render :show, status: :created, location: [@campaign, @character]
    else
      render json: @character.errors, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    if @character.update(character_params)
      render :show, status: :ok, location: [@campaign, @character]
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    def set_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :bio)
    end
end
