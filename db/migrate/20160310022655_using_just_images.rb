class UsingJustImages < ActiveRecord::Migration
  def change
	  remove_column :products, :image_list
	  add_column :products, :image, :string
  end
end
