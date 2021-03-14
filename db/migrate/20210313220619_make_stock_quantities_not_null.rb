class MakeStockQuantitiesNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_default :stocks, :quantity, from: nil, to: 0
    change_column_default :products, :stock, from: nil, to: 0
    Stock.update_all(quantity: 0)
    Product.update_all(stock: 0)
    change_column_null :stocks, :quantity, false
    change_column_null :products, :stock, false
  end
end
