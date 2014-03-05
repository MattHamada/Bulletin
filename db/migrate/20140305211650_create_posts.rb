class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :topic_id
      t.integer :sub_board_id
      t.integer :board_id
      t.timestamps
    end
  end
end
