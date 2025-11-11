class ChangeSupplierIdToNumber < ActiveRecord::Migration[7.2]
  def change
    change_column :products, :supplier_id, 'integer USING supplier_id::integer'
  end
end
