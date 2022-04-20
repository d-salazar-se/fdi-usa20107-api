class Admin::DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :update, :destroy]

  # GET /admin/departments
  def index
    @departments = Department.all

    render json: @departments
  end

  # GET /admin/departments/1
  def show
    render json: @department, include: ['careers']
  end

  # POST /admin/departments
  def create
    @department = Department.new(department_params)

    if @department.save
      render json: @department, status: :created, location: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/departments/1
  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admin/departments/1
  def destroy
    @department.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def department_params
      params.fetch(:department, {}).permit(:name)
    end
end
