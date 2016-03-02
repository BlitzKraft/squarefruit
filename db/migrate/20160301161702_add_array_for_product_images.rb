class AddArrayForProductImages < ActiveRecord::Migration
  def change
	  add_column :products, :image_list, :string, array: true, default: []
  end
end
