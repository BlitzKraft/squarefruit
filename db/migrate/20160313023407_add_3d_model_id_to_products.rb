class Add3dModelIdToProducts < ActiveRecord::Migration
  def change
	remove_column :products, :product_model_id, :string
	remove_column :products, :image_id, :string
	remove_column :products, :image, :string
	remove_column :products, :image_count, :integer
	#variable names can't start with numbers
	add_column :products, :threeD_model_id, :string
  end
end
