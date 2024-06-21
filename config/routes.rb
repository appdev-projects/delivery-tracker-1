Rails.application.routes.draw do
  root "deliveries#index"
  devise_for :users
  resources :deliveries

end
