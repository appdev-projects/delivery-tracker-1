class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :description
      t.date :estimated_arrival
      t.string :details
      t.string :tracking
      t.boolean :recieved
      t.integer :owner_id

      t.timestamps
    end
  end
end
