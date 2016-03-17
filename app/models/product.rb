class Product < ActiveRecord::Base
	belongs_to :user
	#paperclip
	has_attached_file :threeD_model
	#validates_with AttachmentPresenceValidator, attributes: :threeD_model
	#validates_attachment :threeD_model, presence: true, content_type: { content_type: ["text/plain", "application/octet-stream", "application/sla"] }
	do_not_validate_attachment_file_type :threeD_model
	#validates_with AttachmentSizeValidator, attributes: :threeD_model, less_than: 2.megabytes
	#validates_attachment_content_type
	#has_many :images, dependent: :destroy
	validates :title, presence: true, length: {minimum: 3}
	validates :body, presence: true
end
