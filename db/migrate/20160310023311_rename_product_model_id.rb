class RenameProductModelId < ActiveRecord::Migration
  def change
	  remove_column :products, :product_model_id
	  add_column :products, :product_model, :string
  end
end
