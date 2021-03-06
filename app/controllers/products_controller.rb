class ProductsController < ApplicationController

  #http_basic_authenticate_with name: "Lithyon", password: "My(4K3Ry", except: [:index, :show]

  def index
    @products = Product.all
		respond_to do |format|
			format.json {
				render json: {results: @products}
			}
			format.html
		end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end


  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

end
