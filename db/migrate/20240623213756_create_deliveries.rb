class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.date :supposed_to_arrive_on
      t.string :details
      t.string :description
      t.boolean :arrived
      t.integer :user_id

      t.timestamps
    end
  end
end
