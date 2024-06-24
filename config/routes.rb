Rails.application.routes.draw do
  devise_for :users

  # Custom routes for user authentication handled by UsersController
  get("/user_sign_up", { :controller => "users", :action => "sign_up_form" })        
  post("/insert_user", { :controller => "users", :action => "create"  })
  get("/edit_user_profile", { :controller => "users", :action => "edit_profile_form" })       
  post("/modify_user", { :controller => "users", :action => "update" })
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })
  get("/user_sign_in", { :controller => "users", :action => "sign_in_form" }) 
  post("/user_verify_credentials", { :controller => "users", :action => "create_cookie" })
  get("/user_sign_out", { :controller => "users", :action => "destroy_cookies" })

  # Routes for the Package resource
  post("/insert_package", { :controller => "packages", :action => "create" })
  get("/", { :controller => "packages", :action => "index" })
  get("/packages", { :controller => "packages", :action => "index" })
  get("/packages/:path_id", { :controller => "packages", :action => "show" })
  post("/modify_package/:path_id", { :controller => "packages", :action => "update" })
  get("/delete_package/:path_id", { :controller => "packages", :action => "destroy" })
end
