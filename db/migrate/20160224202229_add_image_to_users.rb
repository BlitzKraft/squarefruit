class AddImageToUsers < ActiveRecord::Migration
  def change
    # Old columns and shit. Not descriptive enough
    remove_column :products, :image_id, :string
    remove_column :products, :model_id, :string

    # ARE YOU NOT ENTERTAINED?
    add_column :users, :profile_image_id, :string
    add_column :products, :product_image_id, :string
    add_column :products, :product_model_id, :string
  end
end
