class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })
    
    matching_recieved_deliveries = Delivery.where({:recieved => true})

    @recieved_deliveries = matching_recieved_deliveries.order({ :created_at => :desc })
    
    matching_expected_deliveries = Delivery.where({:recieved => false})

    @expected_deliveries = matching_expected_deliveries.order({ :created_at => :desc })
 

    render({ :template => "deliveries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch("query_description")
    the_delivery.expected_arrival = params.fetch("query_expected_arrival")
    the_delivery.detail = params.fetch("query_detail")
    the_delivery.recieved = params.fetch("query_recieved", false)

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Delivery created successfully." })
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    # the_delivery.description = params.fetch("query_description")
    # the_delivery.expected_arrival = params.fetch("query_expected_arrival")
    # the_delivery.detail = params.fetch("query_detail")
    the_delivery.recieved = params.fetch("query_recieved", true)

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Delivery updated successfully."} )
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
