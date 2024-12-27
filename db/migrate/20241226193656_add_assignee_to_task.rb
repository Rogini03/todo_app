class AddAssigneeToTask < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :assignee, :integer, null: false
  end
end
