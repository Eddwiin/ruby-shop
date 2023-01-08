class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_user, only: [:update, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save 
      render json: true, status: :created 
    else 
      render json: { errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: true, status: :ok 
    else 
      render json: { errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @user.delete
    render json: true, status: :ok 
  end

  private 

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :phone, :adress, :password)
  end

  def set_user
    @user = User.find(params[:user][:id])
  end 
end
