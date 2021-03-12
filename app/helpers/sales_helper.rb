module SalesHelper
  def get_sale_status(sale)
    products_paid = 0
    sale.sale_products.each do |sp|
      if sp.paid_amount == sp.value
        products_paid += 1
      end
    end
    if products_paid == sale.sale_products.length
      return "#00FF00" #paid
    elsif products_paid > 0
      return "#FDF000" #partially paid
    end
    "#FF0000" #total debt
  end

  def get_product_status(product)
    if product.paid_amount == 0
      "#FF0000"
    elsif product.paid_amount == product.value
      "#00FF00"
    elsif product.paid_amount > 0 && product.paid_amount < product.value
      "#FDF000"
    else
      raise "Sale product with unexpected paid value. ID: #{product.id}"
    end
  end
end
