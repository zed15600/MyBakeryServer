class CreateExpenditures < ActiveRecord::Migration[5.2]
  def change
    create_table :expenditures do |t|
      t.date :date
      t.integer :price

      t.timestamps
    end
  end
end
