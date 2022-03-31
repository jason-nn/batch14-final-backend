class SessionsController < ApplicationController
  def create
    user = User.find_by_email(user_params[:email])

    if user && user.valid_password?(user_params[:password])
      token = user.generate_jwt
      render json: { user_email: user.email, user_id: user.id, token: token }
    else
      head :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
