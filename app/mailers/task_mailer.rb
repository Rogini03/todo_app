class TaskMailer < ApplicationMailer
    def reminder(task)
        @task = task
        user = User.find(task.assignee)
        mail(to: user.email, subject: "Reminder: #{@task.title}")
    end
end
