class ChangeAmmountFieldToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :expenditures_feedstocks, :ammount, :float
  end
end
