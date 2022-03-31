Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/api/v1/cryptocurrencies', to: 'api/v1/cryptocurrencies#all'
  get '/api/v1/cryptocurrencies/:symbol', to: 'api/v1/cryptocurrencies#find'
end
