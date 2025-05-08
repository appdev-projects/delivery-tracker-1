class RemoveReceivedFromDeliveries < ActiveRecord::Migration[7.1]
  def change
    remove_column :deliveries, :received, :boolean
  end
end
