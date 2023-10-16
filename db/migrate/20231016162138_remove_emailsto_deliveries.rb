class RemoveEmailstoDeliveries < ActiveRecord::Migration[7.0]
  def change

    remove_column :deliveries, :email
    remove_column :deliveries, :index_deliveries_on_email
  end
end
