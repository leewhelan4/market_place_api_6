class Api::V1::UsersController < ApplicationController

  # GET /users/{id}
  def show
    render json: User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render @user.errors, status: :unprocessable_entity
    end
  end

  private
  
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
