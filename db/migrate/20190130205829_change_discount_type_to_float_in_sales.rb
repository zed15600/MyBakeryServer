class ChangeDiscountTypeToFloatInSales < ActiveRecord::Migration[5.2]

  def change
		change_column(:sales, :discount, :float)
  end

end
