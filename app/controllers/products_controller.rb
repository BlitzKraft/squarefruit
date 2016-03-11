class ProductsController < ApplicationController
	before_filter :require_permission, only: :edit
	def index
		@products = Product.all.order('created_at DESC')
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to @product
		else
			render 'edit'
		end
	end

	def create
		@product = Product.new(product_params)
		@product.user_id = current_user.id
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

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	def require_permission
		@product = Product.find(params[:id])
		if current_user != Product.find(params[:id]).user
			redirect_to @product
		end
	end

	private 
	def product_params
		params.require(:product).permit(:title, :body, :image, :product_model)
	end
end
