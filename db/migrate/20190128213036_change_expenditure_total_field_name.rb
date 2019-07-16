class ChangeExpenditureTotalFieldName < ActiveRecord::Migration[5.2]
  def change
		rename_column(:expenditures, :price, :total_value)
  end
end
