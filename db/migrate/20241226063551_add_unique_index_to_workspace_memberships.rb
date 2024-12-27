class AddUniqueIndexToWorkspaceMemberships < ActiveRecord::Migration[7.2]
  def change
    add_index :workspace_memberships, [:user_id, :workspace_id], unique: true
  end
end
