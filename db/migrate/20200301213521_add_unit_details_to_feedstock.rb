class AddUnitDetailsToFeedstock < ActiveRecord::Migration[5.2]
  def change
    add_column :feedstocks, :unit_value, :integer
    remove_column :feedstocks, :unit
    add_reference :feedstocks, :unit, foreing_key: true
  end
end
