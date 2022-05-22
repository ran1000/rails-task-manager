class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_parameters)
    @task.save
    redirect_to root_path
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_parameters)
    redirect_to root_path
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_parameters
    params.require(:task).permit(:title, :details, :completed)
  end
end
