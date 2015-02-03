class ChangeTopicUserIdToCreatorId < ActiveRecord::Migration
  def change
    rename_column :topics, :user_id, :creator_id
  end
end
