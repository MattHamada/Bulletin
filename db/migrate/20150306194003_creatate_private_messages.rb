class CreatatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.string  :title
      t.string  :content
      t.integer :creator_id
      t.integer :recipient_id
      t.timestamps
    end

    create_table :private_posts do |t|
      t.string  :content
      t.integer :private_message_id
      t.timestamps
    end
  end
end
