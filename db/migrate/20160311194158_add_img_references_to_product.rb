class AddImgReferencesToProduct < ActiveRecord::Migration
  def change
	add_column :products, :image_count, :integer
  end
end
