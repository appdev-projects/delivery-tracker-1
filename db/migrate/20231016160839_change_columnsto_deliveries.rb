class ChangeColumnstoDeliveries < ActiveRecord::Migration[7.0]
  def change

    remove_column :deliveries, :encrypted_password
    remove_column :deliveries, :remember_created_at
    remove_column :deliveries, :reset_password_sent_at
    remove_column :deliveries, :reset_password_token
    remove_column :deliveries, :index_deliveries_on_email
    remove_column :deliveries, :index_deliveries_on_reset_password_token

    add_column :deliveries, :arrived, :boolean
    add_column :deliveries, :description, :string
    add_column :deliveries, :details, :text
    add_column :deliveries, :supposed_to_arrive_on, :date
    add_column :deliveries, :delivery_id, :integer
    add_column :deliveries, :user_id, :integer
  end
end
