class FixColumnNameInUsers < ActiveRecord::Migration
  def change
	  remove_column :products, :users_id
	  add_column :products, :user_id, :integer
  end
end
