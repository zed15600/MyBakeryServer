class CreateFeedstocks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedstocks do |t|
      t.string :name
      t.string :unit
      t.integer :price
      t.string :provider

      t.timestamps
    end
  end
end
