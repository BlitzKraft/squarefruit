class RemoveImageIdFromProduct < ActiveRecord::Migration
  def change
	remove_column :products, :product_image_id
  end
end
