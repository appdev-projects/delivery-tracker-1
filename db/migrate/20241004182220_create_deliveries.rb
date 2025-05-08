class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.string :description
      t.string :details
      t.date :supposed_to_arrive_on
      t.boolean :arrived

      t.timestamps
    end
  end
end
