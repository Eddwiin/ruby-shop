class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    @user = User.new(user_params)
    if @user.save 
      render json: true, status: :created 
    else 
      debugger
      render json: { errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
  end

  def delete
  end

  private 

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :phone, :adress, :password)
  end
end
