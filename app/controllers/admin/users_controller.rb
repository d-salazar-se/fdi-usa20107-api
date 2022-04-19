class Admin::UsersController < ApplicationController

  def index
    users = User.all
    render json: users, status: 200
  end

  def create
    user = User.create(
      email: params[:email],
      role: params[:role]
    )

    render json: user, status: 201
  end

  def show
    user = User.find(params[:id])

    if not user
      render status: 404
      return
    end
    
    render json: user, status: 200
  end

  def update
    user = User.find(params[:id])

    user.role = params[:role]
    user.enabled = params[:enabled]

    user.save!

    render json: user, status: 200
  end
end
