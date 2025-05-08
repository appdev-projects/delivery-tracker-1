class AddArrivedToDeliveries < ActiveRecord::Migration[7.1]
  def change
    add_column :deliveries, :arrived, :boolean
  end
end
