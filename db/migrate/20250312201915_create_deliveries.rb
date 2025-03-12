class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.boolean :arrived
      t.string :description
      t.string :details
      t.date :supposed_to_arrive_on
      t.integer :user_id

      t.timestamps
    end
  end
end
