class AddColumnForStlFile < ActiveRecord::Migration
  def change
	  add_column :products, :stl_file_url, :string
	  add_column :products, :stl_title, :string
  end
end
