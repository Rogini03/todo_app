class Workspace < ApplicationRecord
    has_many :workspace_memberships
    has_many :users, through: :workspace_memberships

    validates :name, presence: true
    validates :url,presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }, uniqueness: true
    validates :api_key, presence: true, uniqueness: true

    before_validation :generate_api_key, on: :create

    def add_member(user)
        workspace_memberships.create!(user:user)
        rescue ActiveRecord::RecordInvalid => e
          errors.add(:base, "Failed to add member: #{e.message}")
        false
    end

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(20)
  end
end
