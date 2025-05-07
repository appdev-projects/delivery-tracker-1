class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :description
      t.text :details
      t.date :supposed_to_arrive_on
      t.boolean :received

      t.timestamps
    end
  end
end
