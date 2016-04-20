class ProductsController < ApplicationController
	before_filter :require_permission, only: :edit
	# todo Handle error gracefully. Now it's an error.
	# try and figure out raising 404
	def index
		if current_user.try(:admin?)
			@products = Product.where(:archived => false).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
		elsif !current_user.nil?
			@products = current_user.products.all.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
		end
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		isBinaryString = Paperclip.io_adapters.for(@product.threeD_model).read(80)
		@product.stl_binary = !(isBinaryString.include? "solid")
		if @product.update(product_params)
			if current_user.admin
				unless @product.price.nil? and @product[:status] < 3
					@product[:status] = 3
					@product.save
				end
				if @product[:status] == 7
					@product.archived = true
					@product.save
				end
				redirect_to root_path
			else
				redirect_to @product
			end
		else
			render 'edit'
		end
	end

	def create
		@product = Product.new(product_params)
		@product.user_id = current_user.id
		isBinaryString = Paperclip.io_adapters.for(@product.threeD_model).read(80)
		@product.stl_binary = !(isBinaryString.include? "solid")
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
		if current_user.admin
			if (params[:id] == 'archive')
				@products = Product.where(:archived => true).paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
			render 'index'
			else 
				@product = Product.find(params[:id])
			end
		elsif !current_user.nil?
			@product = current_user.products.find(params[:id]) 
		else
			redirect_to not_found
		end
	end

	def not_found
		raise ActiveRecord::RecordNotFound
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	def require_permission
		@product = Product.find(params[:id])
		if current_user != Product.find(params[:id]).user or current_user.admin
			redirect_to @product
		end
	end

	private 
	def product_params
		if current_user.admin
			params.require(:product).permit(:id, :title, :body, :threeD_model, :status, :price)
		else
			params.require(:product).permit(:id, :title, :body, :threeD_model)
		end
	end

	def user_is_current_user
		unless current_user.id == Product.find(params[:id]).user_id
			flash[:notice] = "You are not authorized."
			redirect_to root_path
		end
	end
end
