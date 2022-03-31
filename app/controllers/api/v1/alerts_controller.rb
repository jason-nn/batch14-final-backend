class Api::V1::AlertsController < ApplicationController
  before_action :authenticate_user!

  def all
    render json: Alert.where(user_id: @current_user_id)
  end

  def create
    alert = current_user.alerts.new(alert_params)

    if alert.save
      render json: alert
    else
      head :unprocessable_entity
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:cryptocurrency_id, :price, :operator)
  end
end
