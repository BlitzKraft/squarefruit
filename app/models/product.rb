class Product < ActiveRecord::Base
	belongs_to :user
	has_many :images
	accepts_attachments_for :image
	attachment :product_model

	validates :title, presence: true, length: {minimum: 3}
	#validates :body, presence: true
	##validates :product_model, presence: true
end
