class DeliveriesController < ApplicationController
  def index
    unless current_user
      redirect_to("/users/sign_in")
    end
  end
  def create
  end
  def update
  end
  def destroy
  end
end
