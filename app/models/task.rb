class Task < ApplicationRecord
  searchkick
  after_save :schedule_reminder
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :due_date, presence: true
  validates :assignee, presence: true
  validates :priority, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
private

def schedule_reminder
  return unless remind_me_before_at.present?

  TaskReminderJob.set(wait_until: remind_me_before_at).perform_later(id)
end

end
