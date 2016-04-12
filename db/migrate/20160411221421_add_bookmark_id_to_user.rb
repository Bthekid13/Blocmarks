class AddBookmarkIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :bookmark_id, :integer
    add_index :users, :bookmark_id
  end
end
