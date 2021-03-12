class SaleProductsController < ApplicationController
  def pay
    product = SaleProduct.find(params[:id])
    hidden = product.product_id != 1 || product.vendor_id != 1
    Payment.create!(vendor_id: product.sale.vendor_id, value: product.value, date: Date.today, hidden: hidden)
    product.update(paid_amount: product.value)
    product.sale.vendor.update(debt: product.sale.vendor.debt -= product.value)
    respond_to { |f| f.json }
  end
end
