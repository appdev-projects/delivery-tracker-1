class RenameDeliveryOnToSupposedToArriveOn < ActiveRecord::Migration[7.1]
  def change
    rename_column :deliveries, :delivery_on, :supposed_to_arrive_on
  end
end
