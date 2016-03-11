class RenameImageProductModelWithId < ActiveRecord::Migration
  def change
	  remove_column :products, :image
	  remove_column :products, :product_model
	  add_column :products, :image_id, :string
	  add_column :products, :product_model_id, :string
  end
end
