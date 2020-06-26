class UpdateFeedstockProvider < ActiveRecord::Migration[5.2]
  def change
    remove_column :feedstocks, :provider, :string
    add_reference :feedstocks, :provider, foreing_key: true
  end
end
