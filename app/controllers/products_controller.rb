class ProductsController < ApplicationController
	def index
		@product = Product.all
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		@product.save

		redirect_to @product
	end
	def show
		@product = Product.find(params[:id])
	end
	def product_params
		params.require(:product).permit(:title, :body)
	end
	private :product_params
end
