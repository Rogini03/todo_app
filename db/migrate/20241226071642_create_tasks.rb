class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :due_date
      t.integer :priority
      t.datetime :remind_me_before_at
      t.references :user, null: false, foreign_key: true
      t.boolean :completion_status,default: false

      t.timestamps
    end
  end
end
