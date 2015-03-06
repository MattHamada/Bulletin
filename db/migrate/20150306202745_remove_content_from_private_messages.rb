class RemoveContentFromPrivateMessages < ActiveRecord::Migration
  def change
    remove_column :private_messages, :content
  end
end
