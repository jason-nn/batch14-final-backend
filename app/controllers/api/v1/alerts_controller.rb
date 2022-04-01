class Api::V1::AlertsController < ApplicationController
  before_action :authenticate_user!

  def all
    render json:
             Alert
               .where(user_id: @current_user_id)
               .to_json(include: :cryptocurrency)
  end

  def create
    alert = current_user.alerts.new(alert_params)

    if alert.save
      render json: alert.to_json(include: :cryptocurrency)
    else
      head :unprocessable_entity
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:cryptocurrency_id, :price, :operator)
  end
end
