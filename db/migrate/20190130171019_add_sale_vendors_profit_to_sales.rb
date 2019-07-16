class AddSaleVendorsProfitToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :vendors_profit, :integer
  end
end
