Rails.application.routes.draw do
  root "deliveries#index"
  devise_for :users
  get "/delete_delivery/:id", controller: "deliveries", action: "destroy"
  post "/modify_delivery/:id", controller: "deliveries", action: "update"
  resources :deliveries

end
