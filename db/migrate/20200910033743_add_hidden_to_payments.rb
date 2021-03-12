class AddHiddenToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :hidden, :boolean, { default: false }
  end
end
