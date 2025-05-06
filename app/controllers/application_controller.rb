class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    deliveries_path
  end
  skip_forgery_protection
end
