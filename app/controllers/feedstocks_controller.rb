class FeedstocksController < ApplicationController

	#http_basic_authenticate_with name: "Lithyon", password: "My(4K3Ry"

  def index
		@feedstocks = Feedstock.all.order(name: :asc)
		respond_to do |format|
			format.json {
				render json: {results: @feedstocks}
			}
			format.html
		end
  end

  def show
		@feedstock = Feedstock.find(params[:id])
  end

  def new
		@feedstock = Feedstock.new
  end

  def edit
		@feedstock = Feedstock.find(params[:id])
  end

  def create
		@feedstock = Feedstock.new(feedstock_params)
		if @feedstock.save
			redirect_to @feedstock
		else
			render 'new'
		end
  end

  def update
		@feedstock = Feedstock.find(params[:id])
		if @feedstock.update(feedstock_params)
			redirect_to @feedstock
		else
			render 'edit'
		end
  end


  private
  def feedstock_params
    params.require(:feedstock).permit(:name, :price, :unit_id, :unit_value, :provider_id)
  end

end
