class AddUserIdToDeliveries < ActiveRecord::Migration[7.0]
  def change
    add_column :deliveries, :user_id, :integer
  end
end
