class AddNewColumnToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :supplier_id, :string
  end
end
