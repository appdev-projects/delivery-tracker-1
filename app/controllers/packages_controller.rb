class PackagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @deliveries = Delivery.where(arrived: false)
    @received_deliveries = Delivery.where(arrived: true)
  end

  def show
    @delivery = Delivery.find(params[:path_id])
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user = current_user
    if @delivery.save
      redirect_to("/", { notice: "Delivery created successfully." })
    else
      render("packages/new")
    end
  end

  def update
    @delivery = Delivery.find(params[:path_id])
    if @delivery.update(delivery_params)
      redirect_to("/", { notice: "Delivery updated successfully." })
    else
      render("packages/edit")
    end
  end

  def destroy
    @delivery = Delivery.find(params[:path_id])
    @delivery.destroy
    redirect_to("/", { notice: "Delivery deleted successfully." })
  end

  private

  def delivery_params
    params.require(:delivery).permit(:description, :supposed_to_arrive_on, :details, :arrived)
  end
end
