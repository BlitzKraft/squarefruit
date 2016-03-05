class Product < ActiveRecord::Base
	belongs_to :user
	attachment :image_list
	accepts_attachments_for :image_list
	#attachment :product_image
	#has_many :product_images, dependent: :destroy
	#accepts_attachments_for :product_images, append: true
	attachment :product_model
	accepts_attachments_for :product_model, attachment: :file, append: true

	#validates :title, presence: true, length: {minimum: 3}
	#validates :body, presence: true
	##validates :product_model, presence: true
end
