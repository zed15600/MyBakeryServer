desc "Fixes vendor debt based on sales and payments"
task fix_debt: :environment do
  p "Fixing debts"
  Vendor.all.each do |vendor|
    vendor.debt = 0
    total_paid = 0
    vendor.sales.each do |sale|
      vendor.debt += sale.total_value
    end
    vendor.payments.each do |payment|
      total_paid += payment.value
    end
    vendor.debt -= total_paid
    SaleProduct.includes(:sale, :product).where(sales: {vendor_id: vendor.id}).order("products.pay_order ASC", "sales.date ASC").each do |sp|
      if total_paid == 0
        sp.paid_amount = 0
      elsif total_paid < 0
        raise Exception.new "total_paid less than 0: #{total_paid}"
      end
      if total_paid >= sp.value
        sp.paid_amount = sp.value
        total_paid -= sp.value
      else
        sp.paid_amount = total_paid
        total_paid = 0
      end
      sp.save!
    end
    vendor.save!
  end
end
