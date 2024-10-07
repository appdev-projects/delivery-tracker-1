class PackagesController < ApplicationController
  def index
    matching_packages = Package.all

    @list_of_packages = matching_packages.order({ :created_at => :desc })

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
    the_package.tracking = params.fetch("query_tracking")
    the_package.recieved = params.fetch("query_recieved", false)
    the_package.owner_id = params.fetch("query_owner_id")

    if the_package.valid?
      the_package.save
      redirect_to("/packages", { :notice => "Package created successfully." })
    else
      redirect_to("/packages", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.description = params.fetch("query_description")
    the_package.estimated_arrival = params.fetch("query_estimated_arrival")
    the_package.details = params.fetch("query_details")
    the_package.tracking = params.fetch("query_tracking")
    the_package.recieved = params.fetch("query_recieved", false)
    the_package.owner_id = params.fetch("query_owner_id")

    if the_package.valid?
      the_package.save
      redirect_to("/packages/#{the_package.id}", { :notice => "Package updated successfully."} )
    else
      redirect_to("/packages/#{the_package.id}", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.destroy

    redirect_to("/packages", { :notice => "Package deleted successfully."} )
  end
end
