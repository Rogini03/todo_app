class WorkspaceMembership < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  validates :user_id, uniqueness: { scope: :workspace_id, message: "is already added to this workspace" }
end
