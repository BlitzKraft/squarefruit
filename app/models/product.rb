class Product < ActiveRecord::Base
	belongs_to :user
	has_many :images, dependent: :destroy
	accepts_attachments_for :images, attachment: :file
	#attachment :image, content_type: ["image/jpeg", "image/png", "image/gif"]
	
	#attachment :product_model
	validates :title, presence: true, length: {minimum: 3}
	#validates :body, presence: true
	##validates :product_model, presence: true
end
