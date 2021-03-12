class AddPayOrderToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pay_order, :integer
  end
end
