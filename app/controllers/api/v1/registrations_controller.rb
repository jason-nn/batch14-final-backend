class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(user_params)

    if user.save
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
