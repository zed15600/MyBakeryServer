class SetDefaultValueToVendorsProfit < ActiveRecord::Migration[5.2]
  def change
		change_column_default(:vendors, :debt, 0)
		change_column_null(:vendors, :debt, false)
  end
end
