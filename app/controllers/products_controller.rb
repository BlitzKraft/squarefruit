class ProductsController < ApplicationController
	def index
		@product = Product.all
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		respond_to do |format| 
			if @product.save
				format.html { redirect_to @product, notice: 'Listing successfully created.' }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render :new }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end
	def show
		@product = Product.find(params[:id])
	end
	def product_params
		params.require(:product).permit(:title, :body, :image, :product_image)
	end
	private :product_params

end
