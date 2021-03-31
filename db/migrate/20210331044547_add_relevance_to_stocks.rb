class AddRelevanceToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :relevant, :boolean, default: true
  end
end
