class SaleProductsController < ApplicationController
  def pay
    product = SaleProduct.find(params[:id])
    Payment.create!(vendor_id: product.sale.vendor_id, value: product.value, date: Date.today, product_id: product.product_id)
    product.update(paid_amount: product.value)
    product.sale.vendor.update(debt: product.sale.vendor.debt -= product.value)
    respond_to { |f| f.json }
  end
end
