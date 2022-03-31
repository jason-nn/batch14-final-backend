class RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(user_params)

    if user.save
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
