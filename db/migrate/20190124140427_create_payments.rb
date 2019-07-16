class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.date :date
      t.references :vendor, foreign_key: true
      t.integer :ammount

      t.timestamps
    end
  end
end
