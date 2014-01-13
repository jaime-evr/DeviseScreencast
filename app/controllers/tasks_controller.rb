class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :permited_params, only: [:create]

  def index
    @tasks = current_user.tasks
    puts "*"*100
    puts @tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new permited_params
    @task.user_id = current_user.id
    if @task.save
      flash[:notice] = "Task created successfully"
      redirect_to @task
    else
      flash[:alert] = "Task has not been created"
      redirect_to new_task_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task has been deleted"
      redirect_to tasks_path
    else
      flash[:alert] = "Tash has not been deleted"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private
  def permited_params
    params.require(:task).permit(:name, :comments)
  end
end
