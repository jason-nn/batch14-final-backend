Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               registrations: :registrations,
               sessions: :sessions,
             }

  devise_scope :user do
    post '/api/v1/sessions', to: 'api/v1/sessions#create'
    post '/api/v1/registrations', to: 'api/v1/registrations#create'
  end

  get '/api/v1/cryptocurrencies', to: 'api/v1/cryptocurrencies#all'
  get '/api/v1/cryptocurrencies/symbols', to: 'api/v1/cryptocurrencies#symbols'
  get '/api/v1/cryptocurrencies/:symbol', to: 'api/v1/cryptocurrencies#find'

  get '/api/v1/purchases', to: 'api/v1/purchases#all'
  post '/api/v1/purchases', to: 'api/v1/purchases#create'

  get '/api/v1/alerts', to: 'api/v1/alerts#all'
  post '/api/v1/alerts', to: 'api/v1/alerts#create'
  delete '/api/v1/alerts/:id', to: 'api/v1/alerts#destroy'

  mount ActionCable.server => '/cable'
end
