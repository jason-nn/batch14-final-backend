COINGECKO_API_V3_URL = 'https://api.coingecko.com/api/v3'

class CryptocurrencyPriceUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Cryptocurrency.all.each do |cryptocurrency|
      updated_price = price(cryptocurrency.coingecko_id)
      cryptocurrency.update(price: updated_price)
    end

    ActionCable.server.broadcast 'price_update_channel', Cryptocurrency.all

    self.class.set(wait: 5.minutes).perform_later
  end

  private

  def price(name)
    url = "#{COINGECKO_API_V3_URL}/simple/price?ids=#{name}&vs_currencies=usd"
    JSON.parse(RestClient.get(url).body)[name]['usd']
  end
end
