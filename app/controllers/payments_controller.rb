class PaymentsController < ApplicationController

	#http_basic_authenticate_with name: "Lithyon", password: "My(4K3Ry", except: [:index, :show]

  def index
		@payments = Payment.order(date: :desc).all
		respond_to do |format|
			format.json {
				#response = Vendor.all.collect {|v| {vendor: v.name, payments: v.payments.collect {|p| {id: p.id, date: p.date, value: p.value}}}}
				response = @payments.collect {|p| {id: p.id, vendor_id: p.vendor_id, date: p.date, value: p.value}}
				render json: {results: response}
			}
			format.html
		end
  end

  def show
		@payment = Payment.find(params[:id])
  end

  def new
		@payment = Payment.new
  end

  def edit
		@payment = Payment.find(params[:id])
  end

  def create
		@payment = Payment.new(payment_params)
		if @payment.save
			#Deducing the payment from vendor's debt
			@payment.vendor.debt -= @payment.value
			@payment.vendor.save
			respond_to do |format|
				format.json {
					render json: {id: @payment.id, vendor_id: @payment.vendor_id, date: @payment.date, value: @payment.value}
				}
				format.html {
					redirect_to @payment
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
		@payment = Payment.find(params[:id])
		payOld_vendor = @payment.vendor
		payOld_value = @payment.value
		pars = payment_params
		@payment.date = pars[:date]
		@payment.vendor_id = pars[:vendor_id]
		@payment.value = pars[:value]
		if @payment.valid?
			if @payment.vendor_id_changed?
				payOld_vendor.debt += payOld_value
				payOld_vendor.save
				@payment.vendor.debt -= @payment.value
				@payment.vendor.save
			elsif @payment.value_changed?
				@payment.vendor.debt -= @payment.value - payOld_value
				@payment.vendor.save
			end
			@payment.save
			respond_to do |format|
				format.json {
					render json: {id: @payment.id, vendor_id: @payment.vendor_id, date: @payment.date, value: @payment.value}
				}
				format.html {
					redirect_to @payment
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
		def payment_params
			params.require(:payment).permit(:date, :vendor_id, :value)
		end

end
