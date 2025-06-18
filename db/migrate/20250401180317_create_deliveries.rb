class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :description
      t.date :expected_arrival
      t.text :detail
      t.boolean :recieved

      t.timestamps
    end
  end
end
