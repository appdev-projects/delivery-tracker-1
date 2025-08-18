class AddNotNullConstraintToPackages < ActiveRecord::Migration[7.1]
  def change
    change_column_null :packages, :description, false
    change_column_null :packages, :delivery_date, false
  end
end
