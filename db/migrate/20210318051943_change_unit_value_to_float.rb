class ChangeUnitValueToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :units, :value, :float
  end
end
