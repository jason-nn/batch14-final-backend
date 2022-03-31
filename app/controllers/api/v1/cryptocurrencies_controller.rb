class Api::V1::CryptocurrenciesController < ApplicationController
  before_action :authenticate_user!

  def all
    render json: Cryptocurrency.all
  end

  def find
    render json: Cryptocurrency.find_by(symbol: params[:symbol].upcase)
  end
end
