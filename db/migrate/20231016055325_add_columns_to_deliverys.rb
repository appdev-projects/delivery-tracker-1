class AddColumnsToDeliverys < ActiveRecord::Migration[7.0]
  def change
    add_column :deliveries, :arrived, :string
    add_column :deliveries, :description, :string
    add_column :deliveries, :details, :string
    add_column :deliveries, :supposed_to_arrive_on, :date
    add_column :deliveries, :user_id, :integer
  end
end
