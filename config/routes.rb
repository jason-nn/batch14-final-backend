Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               registrations: :registrations,
               sessions: :sessions,
             }

  get '/api/v1/cryptocurrencies', to: 'api/v1/cryptocurrencies#all'
  get '/api/v1/cryptocurrencies/:symbol', to: 'api/v1/cryptocurrencies#find'

  get '/api/v1/purchases', to: 'api/v1/purchases#all'
  post '/api/v1/purchases', to: 'api/v1/purchases#create'

  get '/api/v1/alerts', to: 'api/v1/alerts#all'
  post '/api/v1/alerts', to: 'api/v1/alerts#create'

  devise_scope :user do
    post '/api/v1/sessions', to: 'api/v1/sessions#create'
    post '/api/v1/registrations', to: 'api/v1/registrations#create'
  end
end
