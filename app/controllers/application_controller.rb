class ApplicationController < ActionController::API
  respond_to :json
  before_action :process_token

  private

  def process_token
    if request.headers['Authorization'].present?
      begin
        jwt_payload =
          JWT.decode(
            request.headers['Authorization'].split(' ')[1].remove('"'),
            Rails.application.secrets.secret_key_base,
          ).first
        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end

  def signed_in?
    @current_user_id.present?
  end

  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user = User.find(@current_user_id)
  end
end
