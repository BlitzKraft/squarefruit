class RemoveStlColumns < ActiveRecord::Migration
  def change
	  remove_column :products, :stl_file_url, :string
	  remove_column :products, :stl_title, :string
  end
end
