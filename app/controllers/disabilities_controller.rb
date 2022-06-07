class DisabilitiesController < ApplicationController
  before_action :set_disability, only: [:show, :update, :destroy]

  # GET /disabilities
  def index
    @disabilities = Disability.all

    render json: @disabilities
  end

  # GET /disabilities/1
  def show
    render json: @disability
  end

  # POST /disabilities
  def create
    @disability = Disability.new(disability_params)

    if @disability.save
      render json: @disability, status: :created, location: @disability
    else
      render json: @disability.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /disabilities/1
  def update
    if @disability.update(disability_params)
      render json: @disability
    else
      render json: @disability.errors, status: :unprocessable_entity
    end
  end

  # DELETE /disabilities/1
  def destroy
    @disability.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disability
      @disability = Disability.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def disability_params
      params.require(:disability).permit(:name)
    end
end
