class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :description
      t.date :delivery_date
      t.text :details
      t.boolean :delivery_status
      t.datetime :created_on
      t.datetime :updated_on

      t.timestamps
    end
  end
end
