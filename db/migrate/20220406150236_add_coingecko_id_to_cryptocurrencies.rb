class AddCoingeckoIdToCryptocurrencies < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptocurrencies, :coingecko_id, :string
  end
end
