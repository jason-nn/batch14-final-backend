COINGECKO_API_V3_URL = 'https://api.coingecko.com/api/v3'

class Api::V1::CryptocurrenciesController < ApplicationController
  before_action :authenticate_user!

  def all
    render json: Cryptocurrency.all
  end

  def find
    unless Cryptocurrency.find_by(symbol: params[:symbol]).nil?
      render json: Cryptocurrency.find_by(symbol: params[:symbol])
    else
      cryptocurrency = search(params[:symbol])
      if cryptocurrency['symbol'].downcase == params[:symbol]
        current_price =
          Cryptocurrency.create(
            name: cryptocurrency['name'],
            symbol: cryptocurrency['symbol'].downcase,
            price: price(cryptocurrency['id']),
            coingecko_id: cryptocurrency['id'],
          )
        render json: Cryptocurrency.find_by(symbol: params[:symbol])
      else
        head :unprocessable_entity
      end
    end
  end

  private

  def search(query)
    url = "#{COINGECKO_API_V3_URL}/search?query=#{query}"
    JSON.parse(RestClient.get(url).body)['coins'].first
  end

  def price(name)
    url = "#{COINGECKO_API_V3_URL}/simple/price?ids=#{name}&vs_currencies=usd"
    JSON.parse(RestClient.get(url).body)[name]['usd']
  end
end
