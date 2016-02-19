class UploadsController < ApplicationController
	def new
	end
	def create
		# Create an object in the bucket
		obj = S3_BUCKET.objects(params[:file].original_filename)
		# Upload the file
		obj.write([:file])
		# Create an upload object
		@upload = Upload.new(
			url: obj.public_url,
			name: obj.key
		)

		if @upload.save
			#redirect_to uploads_path, success: 'File successfully uploaded'
			redirect_to new_upload_path, success: 'File successfully uploaded'
		else
			flash.now[:notice] = 'There was an error'
			render :new
		end
	end
	def index
		@uploads = Upload.all
	end
end
