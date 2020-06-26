class ChangeUnitReferenceNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :units, :unit_id, true
  end
end
