class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def show
    @task = Task.where(id: params[:id]).first
  end
end
