class AddStlTypeToThreeDModel < ActiveRecord::Migration
  def change
	  # The flag will be set to false for ascii stls
	  add_column :products, :stl_binary, :boolean, default: true
  end
end
