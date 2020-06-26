class ChangeSaleColumnOptional < ActiveRecord::Migration[5.2]
  def change
    change_column_null :sale_products, :sale_id, true
  end
end
