desc "Migrate sales to the new single day register format"
task migrate_sales: :environment do
  p "Migrating sales to new composed format"
  Sale.order(:id).each do |sale|
    first_sale = Sale.order(:id).find_by(date: sale.date)
    first_sale.sale_products << SaleProduct.new(product_id: sale.product_id, quantity: sale.ammount)
    if sale != first_sale
      first_sale.total_value += sale.total_value
    end
    if first_sale.save!
      if sale != first_sale
        sale.delete
      end
    end
  end
end 
