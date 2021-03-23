class AddProductToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :product, foreign_key: true

    Payment.where(hidden: true).update_all(product_id: Product.find_by(name: "Galleta de corazón x22").id)
    Payment.where(hidden: false).update_all(product_id: Product.find_by(name: "Cheesecake").id)

    remove_column :payments, :hidden
  end
end
