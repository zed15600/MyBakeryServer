class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :direction
      t.integer :contact
      t.boolean :deliver
      t.integer :deliverCost
      t.integer :deliverMinAmount

      t.timestamps
    end
  end
end
