class RemoveUsersFkFromFollowships < ActiveRecord::Migration[6.1]
  def change
    if foreign_key_exists?(:followships, :users)
      remove_foreign_key :followships, :users
    end
  end
end
