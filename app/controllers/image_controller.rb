class ImageController < ApplicationController
	def create
		@image = Image.new(image_params)
		@image.user_id = current_user.id
		@image.product_id = params[:id]

		@image.content_type = 
	end

	def new
		@image = Image.new
	end

	def destroy
	end
end
