class DeliveryChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:deliveries, :actual_arrive, :boolean)
  end
end
