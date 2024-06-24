Rails.application.routes.draw do
  devise_for :users
  root "deliveries#index" 
  
  # Routes for the deliverie resource:
  get("/", { :controller => "deliveries", :action => "index" })
  
  # CREATE
  post("/insert_deliveries", { :controller => "deliveries", :action => "create" })
          
  # READ
  get("/deliveries", { :controller => "deliveries", :action => "index" })
  
  get("/deliveries/:path_id", { :controller => "deliveries", :action => "show" })
  
  # UPDATE
  
  post("/modify_delivery/:path_id", { :controller => "deliveries", :action => "update" })
  get("/mark_received/:path_id", { :controller => "deliveries", :action => "mark_as_received" })
  
  # DELETE
  get("/delete_delivery/:path_id", { :controller => "deliveries", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
