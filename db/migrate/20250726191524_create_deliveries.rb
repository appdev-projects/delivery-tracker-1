class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :title
      t.text :body
      t.date :delivery_on
      t.integer :user_id

      t.timestamps
    end
  end
end
