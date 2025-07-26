class RenameBodyToDetails < ActiveRecord::Migration[7.1]
  def change
    rename_column :deliveries, :body, :details
  end
end
