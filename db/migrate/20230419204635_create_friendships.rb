class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.references :requestee, null: false, foreign_key: { to_table: :users }

      t.boolean :accepted, default: false
      t.timestamps
    end
  end
end
