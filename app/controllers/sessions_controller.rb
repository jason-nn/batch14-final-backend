class SessionsController < ApplicationController
  def create
    user = User.find_by_email(user_params[:email])

    if user && user.valid_password?(user_params[:password])
      token = user.generate_jwt
      render json: { token: token.to_json, email: user.email, id: user.id }
    else
      head :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
