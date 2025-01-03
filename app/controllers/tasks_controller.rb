class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show update destroy ]

  # GET /tasks
  def index
      @tasks = Task.where(user_id: current_user.id).page(params[:page]).per(10)

    if params[:category].present?
      @tasks = @tasks.where(user_id: current_user.id,category_id: params[:category]).page(params[:page]).per(10)
    end

    # Sort tasks if a sort parameter is passed
    if params[:sort].present?
      sort_column = params[:sort] == 'title' ? 'title' : 'created_at'
      @tasks = @tasks.where(user_id:current_user.id).order(sort_column).page(params[:page]).per(10)
    else
      @tasks = @tasks.where(user_id:current_user.id).order(created_at: :desc).page(params[:page]).per(10)
    end

    @categories = Category.all

    render json: @tasks
  end

  #GET  /tasks/search
  def search
    @tasks = Task.search(params[:query], fields: [:title, :description])
    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :priority, :remind_me_before_at, :user_id, :completion_status,:assignee,:category_id)
    end
end
