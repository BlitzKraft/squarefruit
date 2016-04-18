class Product < ActiveRecord::Base
	belongs_to :user
	has_attached_file :threeD_model, dependent: :destroy,
		:storage => :s3,
		:s3_credentials => Proc.new { |a| a.instance.s3_credentials }
	validates_attachment :threeD_model, presence: true, content_type: { content_type: ["text/plain", "application/octet-stream", "application/sla"] }
	validates_attachment_size :threeD_model, :less_than => 30.megabytes
	do_not_validate_attachment_file_type :threeD_model
	#validates_with AttachmentSizeValidator, attributes: :threeD_model, less_than: 2.megabytes
	validates :title, presence: true, length: {minimum: 3}
	enum status: { uploaded: 0, reviewed: 1, optimized: 2, approved: 3, paid: 4, printing: 5, printed: 6, shipped: 7 }

	def s3_credentials 
		{ :s3_region=>ENV['amazon_s3_region'] , :bucket =>ENV['amazon_s3_bucket'] , :access_key_id =>ENV['amazon_s3_access_key'] , :secret_access_key =>ENV['amazon_s3_secret_key'] , :s3_host_name => "s3-us-west-2.amazonaws.com"}
	end
end
