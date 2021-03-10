class RemoveIndexFromFollowship < ActiveRecord::Migration[6.1]
  def change
    remove_index :followee_id, name: "index_followships_on_followee_id"
    remove_index :follower_id, name: "index_followships_on_follower_id"
  end
end
