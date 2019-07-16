class AddTotalValueToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :total_value, :integer
  end
end
