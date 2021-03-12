class RemoveFieldsFromSale < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales, :product_id
    remove_column :sales, :ammount
  end
end
