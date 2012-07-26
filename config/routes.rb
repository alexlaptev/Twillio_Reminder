AppCall::Application.routes.draw do
  #get "omniauth_callbacks/facebook"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  root :to => 'users#index'
end
