class Product < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length: {minimum: 3}
	validates :body, presence: true
	attachment :image_id
	has_many :images, dependent: :destroy
	accepts_attachments_for :images, attachment: :file
end
