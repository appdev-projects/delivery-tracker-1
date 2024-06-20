class ChangeDeliveriesArriveOnColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :deliveries, :arrive_on, :supposed_to_arrive_on
  end
end
