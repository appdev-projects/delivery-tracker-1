class PackagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @list_of_packages = current_user.packages.order(created_at: :desc)

    render({ :template => "packages/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_packages = Package.where({ :id => the_id })

    @the_package = matching_packages.at(0)

    render({ :template => "packages/show" })
  end

  def create
    the_package = Package.new
    the_package.description = params.fetch("query_description")
    the_package.estimated_arrival = params.fetch("query_estimated_arrival")
    the_package.details = params.fetch("query_details")
    #the_package.tracking = params.fetch("query_tracking")
    the_package.recieved = params.fetch("query_recieved", false)
    the_package.user_id = current_user.id

    if the_package.valid?
      the_package.save
      redirect_to("/packages", { :notice => "Added to list." })
    else
      redirect_to("/packages", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_package = Package.find_by(id: the_id)
  
    if the_package.nil?
      redirect_to packages_path, alert: "Package not found."
      return
    end
  
    the_package.recieved = true
  
    if the_package.save
      redirect_to packages_path, notice: "Package marked as received successfully."
    else
      redirect_to packages_path, alert: the_package.errors.full_messages.to_sentence
    end
  end
  

  def destroy
    the_id = params.fetch("path_id")
    the_package = current_user.packages.find_by(id: the_id)

    the_package.destroy

    redirect_to("/packages", { :notice => "Package deleted successfully."} )
  end
end
