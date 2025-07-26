class DeliveriesController < ApplicationController
  def index
    @list_of_deliveries = current_user.deliveries.where.not(arrived: true)
    @arrived_deliveries = Delivery.where(arrived: true)

    render({ template: 'deliveries/index' })
  end

  def show
    the_id = params.fetch('path_id')

    matching_deliveries = Delivery.where({ id: the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ template: 'deliveries/show' })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch('query_description')
    the_delivery.details = params.fetch('query_details')
    the_delivery.supposed_to_arrive_on = params.fetch('query_supposed_to_arrive_on')
    the_delivery.arrived = false
    the_delivery.user_id = current_user.id

    if the_delivery.valid?
      the_delivery.save
      redirect_to('/deliveries', { notice: 'Added to list.' })
    else
      redirect_to('/deliveries', { alert: the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch('path_id')
    the_delivery = Delivery.where({ id: the_id }).at(0)

    the_delivery.arrived = params.fetch('arrived')

    if the_delivery.valid?
      the_delivery.save
      redirect_to('/', { notice: 'Marked as received.' })
    else
      redirect_to('/', { alert: the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch('path_id')
    the_delivery = Delivery.where({ id: the_id }).at(0)

    the_delivery.destroy

    redirect_to('/', { notice: 'Delivery deleted successfully.' })
  end
end
