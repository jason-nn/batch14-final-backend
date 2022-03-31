class Api::V1::PurchasesController < ApplicationController
  before_action :authenticate_user!

  def all
    render json: { data: Purchase.where(user_id: current_user_id) }
  end

  def create
    purchase = Purchase.new(purchase_params)

    if purchase.save
      head :ok
    else
      render json: {
               errors: {
                 'purchase' => ['is invalid'],
               },
             },
             status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params
      .require(:purchase)
      .permit(:user_id, :cryptocurrency_id, :price, :quantity)
  end
end
