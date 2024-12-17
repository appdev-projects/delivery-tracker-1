Rails.application.routes.draw do
  devise_for :users

  # READ
  root "deliveries#index"

  # Routes for the Delivery resource:
  get("/deliveries", { :controller => "deliveries", :action => "deliveries" })

  # CREATE
  post("/insert_delivery", { :controller => "deliveries", :action => "create" })


  get("/deliveries/:path_id", { :controller => "deliveries", :action => "show" })

  # UPDATE

  post("/modify_delivery/:path_id", { :controller => "deliveries", :action => "update" })

  # DELETE
  get("/delete_delivery/:path_id", { :controller => "deliveries", :action => "destroy" })

  #------------------------------

end
