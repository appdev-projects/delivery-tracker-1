class DeliveriesController < ApplicationController
  def index
    unless current_user
      redirect_to("/users/sign_in")
    end
    @my_deliveries = Delivery.where(user_id: current_user)
    @waiting_on_deliveries = @my_deliveries.where(arrived: false)
    @arrived_deliveries = @my_deliveries.where(arrived: true)
  end
  def show
  end
  def create
    @delivery = Delivery.new
    @delivery.description = params[:query_description]
    @delivery.supposed_to_arrive_on = params[:query_supposed_to_arrive_on]
    @delivery.details = params[:query_details]
    @delivery.user_id = current_user.id

    if @delivery.valid?
      @delivery.save
      redirect_to("/deliveries", notice:"Added to list")
    else
      redirect_to("/deliveries", alert: "Delivery failed to create successfully")
    end
  end
  def update
    @delivery = Delivery.where(id: params[:id]).first
    @delivery.arrived = true
    if @delivery.valid?
      @delivery.save
      redirect_to("/deliveries", notice: "Delivery updated successfully")
    else
      redirect_to("/deliveries", alert: "Delivery failed to update successfully")
    end
  end
  def destroy
    @delivery = Delivery.where(id: params[:id]).first
    @delivery.destroy
    redirect_to("/deliveries", notice: "Delivery deleted successfully")
  end
end
