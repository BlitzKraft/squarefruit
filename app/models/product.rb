class Product < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length: {minimum: 3}
	validates :body, presence: true
	attachment :product_image
	attachment :product_model
	has_many :product_images, dependent: :destroy
	accepts_attachments_for :images, attachment: :file
end
