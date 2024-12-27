class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :workspace_memberships
  has_many :workspaces, through: :workspace_memberships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
         
  validates :email, presence: true, uniqueness: true
  
  def jwt_payload
    super
  end
end
