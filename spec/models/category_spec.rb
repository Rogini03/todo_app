require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      category = build(:category) # Correct usage
      expect(category).to be_valid
    end

    it 'is valid with valid attributes' do
      category = build(:category, name:nil)
      expect(category).not_to be_valid
    end
  end
end
