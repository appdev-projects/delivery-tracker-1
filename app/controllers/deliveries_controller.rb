class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    render({ :template => "deliveries/index" })
  end

def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch("query_description")
    the_delivery.details = params.fetch("query_details")
    the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    the_delivery.arrived = params.fetch("query_arrived", false)

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Added to list" })
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.arrived = params.fetch("query_arrived") == "true"

    the_delivery.save

    redirect_to("/", { :notice => "Delivery updated successfully."} )
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
