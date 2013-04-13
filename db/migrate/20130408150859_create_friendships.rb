class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :primary_user_id
      t.integer :friend_id
      t.boolean :approved

      t.timestamps
    end
  end
end
