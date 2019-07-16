class VendorsController < ApplicationController

  #http_basic_authenticate_with name: "Lithyon", password: "My(4K3Ry", except: [:index, :show]

  def index
    @vendors = Vendor.all
		respond_to do |format|
			format.json {
				response = @vendors.collect {|v| {id: v.id, name: v.name, profit: v.profit, debt: v.debt}}
				render json: {vendors: response}
			}
			format.html
		end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
    	redirect_to @vendor
		else 
			render 'new'
		end
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      redirect_to @vendor
    else
      render 'edit'
    end
  end


  private
    def vendor_params
      params.require(:vendor).permit(:name, :profit)
    end

end
