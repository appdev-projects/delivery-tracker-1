class AddUserIdToPackages < ActiveRecord::Migration[7.1]
  def change
    add_column :packages, :user_id, :integer
  end
end
