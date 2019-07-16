class AddDebtToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :debt, :integer
  end
end
