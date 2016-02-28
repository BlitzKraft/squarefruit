class Product < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length: {minimum: 3}
	validates :body, presence: true
	#validates :product_model, presence: true
	attachment :product_image
	attachment :product_model
	#has_many :product_image, dependent: :destroy
	accepts_attachments_for :product_image, attachment: :file
	accepts_attachments_for :product_model, attachment: :file
end
