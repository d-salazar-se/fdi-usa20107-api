class Admin::CareersController < ApplicationController
  before_action :set_career, only: [:show, :update, :destroy]

  # GET /admin/careers
  def index
    @careers = Career.all

    render json: @careers
  end

  # GET /admin/careers/1
  def show
    render json: @career, include: ['courses']
  end

  # POST /admin/careers
  def create
    @career = Career.new(career_params)

    if @career.save
      render json: @career, status: :created, location: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/careers/1
  def update
    if @career.update(career_params)
      render json: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/careers/1
  def destroy
    @career.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
      @career = Career.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def career_params
      params.fetch(:career, {}).permit(:name)
    end
end
