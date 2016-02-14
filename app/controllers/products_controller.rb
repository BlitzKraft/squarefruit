class ProductsController < ApplicationController
	def index
	end
	def new
	end
	def create
		@product = Product.new(product_params)
		@product.save

		redirect_to @product
	end
	private
		def product_params
			params.require(:product).permit(:title, :body)
		end
end
