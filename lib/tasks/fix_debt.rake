desc "Fixes vendor debt based on sales and payments"
task fix_debt: :environment do
  p "Fixing debts"
  Vendor.all.each do |vendor|
    vendor.debt = 0
    total_paid = {}
    vendor.sales.each do |sale|
      vendor.debt += sale.total_value
    end
    vendor.payments.each do |payment|
      if total_paid[payment.product_id] == nil
        total_paid[payment.product_id] = 0
      end
      total_paid[payment.product_id] += payment.value
    end
    vendor.debt -= total_paid.values.inject(:+)

    SaleProduct.includes(:sale, :product).where(sales: {vendor_id: vendor.id}).order("products.pay_order ASC", "sales.date ASC").each do |sp|
      if total_paid[sp.product_id] == 0
        sp.paid_amount = 0
      elsif total_paid[sp.product_id] < 0
        raise Exception.new "total_paid less than 0: #{total_paid[sp.product_id]} for product id #{sp.product_id}"
      elsif total_paid[sp.product_id] >= sp.value
        sp.paid_amount = sp.value
        total_paid[sp.product_id] -= sp.value
      else
        sp.paid_amount = total_paid[sp.product_id]
        total_paid[sp.product_id] = 0
      end
      sp.save!
    end
    vendor.save!

    p "Debts fixed for vendor #{vendor.name}. Payments hash: #{total_paid}"
  end
end
