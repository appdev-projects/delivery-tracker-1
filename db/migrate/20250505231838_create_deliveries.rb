class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.string :description
      t.date :supposed_to_arrive_on
      t.text :details
      t.boolean :arrived

      t.timestamps
    end
  end
end
