class SalesController < ApplicationController

  def index
    @vendor_id = params[:vendor_id]
    @sales = Sale.includes(:sale_products, :vendor).order(date: :desc).all
    @sales = @sales.where(vendor_id: @vendor_id) if @vendor_id.present?
    respond_to do |format|
      format.json { render json: { results: @sales } }
      format.html
    end
  end

  def new
    @sale = Sale.new
    @sale.sale_products << SaleProduct.new
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def create
    @sale = Sale.new(sale_params)
    create_products
    if @sale.save
      @sale.vendor.debt += @sale.total_value
      @sale.vendor.save
      redirect_to sales_path
    else
      render "new"
    end
  end

  def update
    @sale = Sale.find(params[:id])
    old_vendor = @sale.vendor
    old_value = @sale.total_value
    update_products
    if @sale.update(sale_params)
      check_update(old_vendor, old_value)
      respond_to do |format|
	format.json { render json: @sale }
	format.html { redirect_to edit_sale_path(@sale) }
      end
    else
      respond_to do |format|
	format.json { render json: {error: "something went wrong with the request."}, status: 400 }
	format.html { render "edit" }
      end
    end
  end

  private

  def create_products
    product_params[:ids].each.with_index do |id, i|
      @sale.sale_products << SaleProduct.create!(parse_product(i))
    end
  end

  def update_products
    p "products: #{product_params[:ids]}"
    @sale.sale_products.each do |sp|
      id = sp.product_id.to_s
      if id.in? product_params[:ids]
        i = product_params[:ids].index(id)
        sp.update(quantity: product_params[:quantities][i])
        product_params[:ids].delete_at(i)
        product_params[:quantities].delete_at(i)
      else
        sp.delete
      end
    end
    create_products
  end

  def parse_product(i)
    {
      product_id: product_params[:ids][i],
      quantity: product_params[:quantities][i]
    }
  end

  def check_update(old_vendor, old_total)
    if @sale.vendor_id != old_vendor.id
      old_vendor.debt -= old_total
      old_vendor.save
      @sale.vendor.debt += @sale.total_value
      @sale.vendor.save
    elsif @sale.total_value != old_total
      @sale.vendor.debt += @sale.total_value - old_total
      @sale.vendor.save
    end
  end

  def sale_params
    @pars ||= params.require(:sale).permit(:date, :vendor_id, :total_value)
  end

  def product_params
    @products ||= params.require(:products).permit(ids: [], quantities: [])
  end

end
