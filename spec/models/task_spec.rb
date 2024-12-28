require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      task = build(:task) # Correct usage
      expect(task).to be_valid
    end

    it 'is valid with valid attributes' do
      task = build(:task, title:nil)
      expect(task).not_to be_valid
    end

    it 'is valid with valid attributes' do
      task = build(:task, due_date:nil)
      expect(task).not_to be_valid
    end

    it 'is valid with valid attributes' do
      task = build(:task, assignee:nil)
      expect(task).not_to be_valid
    end

    it 'is valid with valid attributes' do
      task = build(:task,priority:nil)
      expect(task).not_to be_valid
    end

    it 'is valid with valid attributes' do
      task = build(:task,user:nil)
      expect(task).not_to be_valid
    end

    it 'is valid with valid attributes' do
      task = build(:task,category:nil)
      expect(task).not_to be_valid
    end
  end
end
