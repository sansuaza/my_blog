class ChangecolumnsFollowshipFromUser < ActiveRecord::Migration[6.1]
  def change
    change_column_null :followships, :followee_id, true
    change_column_null :followships, :follower_id, true
  end
end
