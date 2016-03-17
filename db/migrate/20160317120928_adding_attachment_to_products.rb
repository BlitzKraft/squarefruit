class AddingAttachmentToProducts < ActiveRecord::Migration
  def change
	remove_column :products, :threeD_model_id, :string
	add_attachment :products, :threeD_model
  end
end
