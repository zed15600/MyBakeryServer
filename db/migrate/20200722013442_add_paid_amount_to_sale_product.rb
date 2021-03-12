class AddPaidAmountToSaleProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_products, :paid_amount, :integer, default: 0
  end
end
