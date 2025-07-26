class RenameTitleToDescriptionOnDeliveries < ActiveRecord::Migration[7.1]
  def change
    rename_column :deliveries, :title, :description
  end
end
