class UsersController < ApplicationController
  
  def index
    redirect_to("/users/sign_in", {alert:"Please sign in to see content"})
  end
end
