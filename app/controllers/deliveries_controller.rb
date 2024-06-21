class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @pending_deliveries = matching_deliveries.order({ :created_at => :desc })

    render({ :template => "deliveries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

end
