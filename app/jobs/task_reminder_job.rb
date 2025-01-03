class TaskReminderJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find(task_id)
    return unless task && task.remind_me_before_at && task.remind_me_before_at > Time.current
    TaskMailer.reminder(task).deliver_now
  end
end
