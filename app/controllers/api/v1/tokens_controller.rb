class Api::V1::TokensController < ApplicationController

  def create
    @user = User.find_by_email(user_params[:email])

    # User#authenticated hashes password and check that it matches
    # the attribute password_digest
    if @user&.authenticate(user_params[:password])
      render json: {
        token: JsonWebToken.encode(user_id: @user.id),
        email: @user.email
      }
    else
      head :unauthorized
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
