class AddStockToFeedstocks < ActiveRecord::Migration[5.2]
  def change
    add_reference :feedstocks, :stock, foreign_key: true
  end
end
