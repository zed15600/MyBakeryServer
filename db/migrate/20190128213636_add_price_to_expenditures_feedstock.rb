class AddPriceToExpendituresFeedstock < ActiveRecord::Migration[5.2]
  def change
    add_column :expenditures_feedstocks, :price, :integer
  end
end
