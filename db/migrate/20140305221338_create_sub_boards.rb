class CreateSubBoards < ActiveRecord::Migration
  def change
    create_table :sub_boards do |t|
      t.string  :name
      t.integer :board_id
      t.timestamps
    end
  end
end
