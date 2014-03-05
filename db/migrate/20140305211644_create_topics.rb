class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :user_id  #topic creator user id
      t.integer :views
      t.integer :replies
      t.integer :sub_board_id
      t.integer :board_id
      t.timestamps
    end
  end
end
