COINGECKO_API_V3_URL = 'https://api.coingecko.com/api/v3'

class CryptocurrencyPriceUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Cryptocurrency.all.each do |cryptocurrency|
      coin = search(cryptocurrency.symbol)
      updated_price = price(coin['id'])

      cryptocurrency.update(price: updated_price)
    end

    self.class.set(wait: 10.minutes).perform_later
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
