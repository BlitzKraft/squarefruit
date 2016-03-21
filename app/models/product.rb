class Product < ActiveRecord::Base
	belongs_to :user
	has_attached_file :threeD_model,
		:storage => :s3,
		:s3_credentials => Proc.new { |a| a.instance.s3_credentials }
	validates_attachment :threeD_model, presence: true, content_type: { content_type: ["text/plain", "application/octet-stream", "application/sla"] }
	do_not_validate_attachment_file_type :threeD_model
	#validates_with AttachmentSizeValidator, attributes: :threeD_model, less_than: 2.megabytes
	#has_many :images, dependent: :destroy
	validates :title, presence: true, length: {minimum: 3}

	def s3_credentials 
		{ :s3_region=> "us-west-2", :bucket => "squarefruit-bucket", :access_key_id => "AKIAI3FB4DWKFXN5XJTA", :secret_access_key => "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"}
	end
end
