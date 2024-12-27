class Task < ApplicationRecord
  searchkick
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :due_date, presence: true
  validates :assignee, presence: true
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
