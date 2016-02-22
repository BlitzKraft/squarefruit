class AddUrLcolumns < ActiveRecord::Migration
  def change
	  add_column :products, :image_id, :string
	  add_column :users, :image_id, :string
	  add_column :products, :model_id, :string
  end
end
