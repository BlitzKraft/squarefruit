class AddColumnsToImages < ActiveRecord::Migration
  def change
	  add_column :images, :product_id, :integer
	  add_column :images, :user_id, :integer
	  add_column :images, :content_type, :string
	  add_column :images, :filesize, :integer
	  add_column :images, :filename, :string
  end
end
