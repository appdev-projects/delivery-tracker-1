class DeliveriesController < ApplicationController
  # before_action :authenticate_user!
  def index

    # if there is no user redirect to the login page
    if current_user == nil
      redirect_to("/users/sign_in")
    else
      matching_deliveries = Delivery.all

      @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

      render({ :template => "deliveries/index" })
    end
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

  def create
    delivery = Delivery.new
    delivery.user_id = current_user.id
    delivery.description = params.fetch("query_description")
    delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    delivery.details = params.fetch("query_details")
    delivery.arrived = false

    if delivery.valid?
      delivery.save
      redirect_to("/deliveries", { :notice => "Added to list." })
    else
      redirect_to("/deliveries", { :alert => delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    # the_delivery.description = params.fetch("query_description")
    # the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    # the_delivery.details = params.fetch("query_details")
    the_delivery.arrived = params.fetch("query_arrived")

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/", { :notice => "Delivery updated successfully." })
    else
      redirect_to("/", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    if the_delivery
      the_delivery.destroy
      redirect_to deliveries_path, notice: "Deleted."
    else
      redirect_to deliveries_path, alert: "Delivery not found."
    end

    # the_delivery.destroy

    # redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
