class UsersController < ApplicationController
  def index
    if current_user != nil

      matching_deliveries = Delivery.all

      @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })
      @list_of_waiting_deliveries = matching_deliveries.where(user_id:current_user.id, arrived:"false")
      @list_of_arrived_deliveries = matching_deliveries.where(user_id:current_user.id, arrived:"true")
      render({ :template => "deliveries/index" })

    else
      redirect_to("/users/sign_in", {notice: "You need to sign in or sign up before continuing."})
    end
  end
end