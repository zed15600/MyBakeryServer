class RenameColumnAmmountFromPayments < ActiveRecord::Migration[5.2]

  def change
		rename_column(:payments, :ammount, :value)
  end

end
