class SalesController < ApplicationController

  def index
		@sales = Sale.order(date: :desc).all
		respond_to do |format|
			format.json {
				render json: {results: @sales}
			}
			format.html
		end
  end

  def show
		@sale = Sale.find(params[:id])
  end

  def new
		@sale = Sale.new
  end

  def edit
		@sale = Sale.find(params[:id])
  end

  def create
		@sale = Sale.new(sale_params)
		if @sale.save
			#Add the ammount of the sale to the vendor's debt
			@sale.vendor.debt += @sale.total_value - check_nulity(@sale.vendors_profit, 0)
			@sale.vendor.save
			respond_to do |format|
				format.json {
					render json: @sale
				}
				format.html {
					redirect_to @sale
				}
			end
		else
			respond_to do |format|
				format.json {
					render json: {error: "something went wrong with the request."}, status: 400
				}
				format.html {
					render 'new'
				}
			end
		end
  end

  def update
		pars = sale_params
		@sale = Sale.find(params[:id])
		saleOld_vendor = @sale.vendor
		saleOld_value = @sale.total_value
		saleOld_vendors_profit = @sale.vendors_profit
		@sale.date = pars[:date]
		@sale.product_id = pars[:product_id]
		@sale.ammount = pars[:ammount]
		@sale.discount = check_nulity(pars[:discount], 0)
		@sale.vendor_id = pars[:vendor_id]
		@sale.total_value = pars[:total_value]
		@sale.vendors_profit = check_nulity(pars[:vendors_profit], 0)
		if @sale.valid?
			if @sale.vendor_id_changed?
				saleOld_vendor.debt -= (saleOld_value - saleOld_vendors_profit)
				saleOld_vendor.save
				@sale.vendor.debt += (@sale.total_value -@sale.vendors_profit)
				@sale.vendor.save
			elsif @sale.total_value_changed?
				@sale.vendor.debt += @sale.total_value - @sale.vendors_profit - (saleOld_value - saleOld_vendors_profit)
				@sale.vendor.save
			end
			@sale.save
			respond_to do |format|
				format.json {
					render json: @sale
				}
				format.html {
					redirect_to @sale
				}
			end
		else
			respond_to do |format|
				format.json {
					render json: {error: "something went wrong with the request."}, status: 400
				}
				format.html {
					render 'edit'
				}
			end
		end
  end


	private
			def sale_params
				params.require(:sale).permit(:date, :product_id, :ammount, :discount, :vendor_id, :total_value, :vendors_profit)
			end
		
			def check_nulity(value, returnIfNull)
    		if value != nil
      		return value
   	 		else
     	 		return returnIfNull
    		end
  		end

end
