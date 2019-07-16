class SetDefaultValuesToSale < ActiveRecord::Migration[5.2]
  def change
		change_column_default(:sales, :discount, 0)
		change_column_null(:sales, :discount, false)
		change_column_default(:sales, :vendors_profit, 0)
		change_column_null(:sales, :vendors_profit, false)
  end
end
