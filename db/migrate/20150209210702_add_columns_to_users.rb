class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timezone, :string
    add_column :users, :signature, :string
    add_attachment :users, :avatar
  end
end
