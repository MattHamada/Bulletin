class AddUserIdIntegerToPrivatePosts < ActiveRecord::Migration
  def change
    add_column :private_posts, :user_id, :integer
  end
end
