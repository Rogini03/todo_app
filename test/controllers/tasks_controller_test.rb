require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url, as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { completion_status: @task.completion_status, description: @task.description, due_date: @task.due_date, priority: @task.priority, remind_me_before_at: @task.remind_me_before_at, title: @task.title, user_id: @task.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show task" do
    get task_url(@task), as: :json
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { completion_status: @task.completion_status, description: @task.description, due_date: @task.due_date, priority: @task.priority, remind_me_before_at: @task.remind_me_before_at, title: @task.title, user_id: @task.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task), as: :json
    end

    assert_response :no_content
  end
end
