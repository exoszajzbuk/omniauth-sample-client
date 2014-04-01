OmniauthSaluqiClient::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  get '/home/index'
  get '/home/blabla'

  root to: 'home#index'
end
