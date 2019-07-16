class RenameDateFieldForSales < ActiveRecord::Migration[5.2]

  def change
		rename_column(:sales, :when, :date)
  end

end
