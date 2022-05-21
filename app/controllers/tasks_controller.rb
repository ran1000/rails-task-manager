class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_parameters)
    @task.save
    redirect_to root_path
  end

  private

  def task_parameters
    params.require(:task).permit(:title, :details, :completed)
  end
end
