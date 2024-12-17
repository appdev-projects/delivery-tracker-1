class PackagesController < ApplicationController
  def index
    signed_in_user = User.where(:id => current_user.id).at(0)
    @undelivered_packages = signed_in_user.undelivered
    @delivered_packages = signed_in_user.delivered

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
    the_package.delivery_date = params.fetch("query_delivery_date")
    the_package.details = params.fetch("query_details")
    the_package.delivery_status = false
    the_package.user_id = current_user.id

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
    the_package.delivery_status = true

    if the_package.valid?
      the_package.save
      redirect_to("packages/index", { :notice => "Marked as received."} )
    else
      redirect_to("packages/index", { :alert => the_package.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_package = Package.where({ :id => the_id }).at(0)

    the_package.destroy

    redirect_to("/packages/index", { :notice => "Deleted."} )
  end
end
