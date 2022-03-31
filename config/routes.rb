Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               registrations: :registrations,
               sessions: :sessions,
             }

  get '/api/v1/cryptocurrencies', to: 'api/v1/cryptocurrencies#all'
  get '/api/v1/cryptocurrencies/:symbol', to: 'api/v1/cryptocurrencies#find'
end
