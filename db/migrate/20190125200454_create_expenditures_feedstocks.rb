class CreateExpendituresFeedstocks < ActiveRecord::Migration[5.2]
  def change
    create_table :expenditures_feedstocks do |t|
      t.references :expenditure, foreign_key: true
      t.references :feedstock, foreign_key: true
      t.integer :ammount

      t.timestamps
    end
  end
end
