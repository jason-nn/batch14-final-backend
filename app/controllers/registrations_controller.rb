class RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(user_params)

    if user.save
      token = user.generate_jwt
      render json: { data: { token: token.to_json } }
    else
      render json: {
               errors: {
                 'user' => ['is invalid'],
               },
             },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
