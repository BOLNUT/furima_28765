Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items , only: [:index]
  get '/users', to: redirect("/users/sign_up")
end
