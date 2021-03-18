class CreateUnitTransformations < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_transformations do |t|
      t.references :unit, foreign_key: true
      t.references :to_unit, foreign_key: { to_table: :units }
      t.float :value
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
