class Api::V1::PurchasesController < ApplicationController
  before_action :authenticate_user!

  def all
    render json: Purchase.where(user_id: @current_user_id)
  end

  def create
    purchase = current_user.purchases.new(purchase_params)

    if purchase.save
      render json: purchase
    else
      head :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:cryptocurrency_id, :price, :quantity)
  end
end
