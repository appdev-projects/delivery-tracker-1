class ChangeDeliveriesArrivedColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :deliveries, :arrived, :boolean, :default => false
  end
end
