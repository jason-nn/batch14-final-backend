class Api::V1::AlertsController < ApplicationController
  before_action :authenticate_user!

  def all
    render json: Alert.where(user_id: current_user.id)
  end

  def create
    alert = Alert.new(alert_params)

    if alert.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def alert_params
    params
      .require(:alert)
      .permit(:user_id, :cryptocurrency_id, :price, :operator)
  end
end
