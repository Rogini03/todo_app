require 'rails_helper'

RSpec.describe Workspace, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      workspace = build(:workspace) # Correct usage
      expect(workspace).to be_valid
    end

    it 'is not valid without a name' do
      workspace = build(:workspace, name: nil)
      expect(workspace).not_to be_valid
    end

    it 'is not valid without an url' do
      workspace = build(:workspace, url: nil)
      expect(workspace).not_to be_valid
    end
  end
end
