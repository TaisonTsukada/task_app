class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_task, only: [:show, :destroy, :edit, :update, :assign]
  before_action :move_to_index, only: [:edit, :update, :assign, :destroy]

  def index
    @tasks = Task.index_all.page(params[:page]).per(6)
  end

  def new
    @task = Task.new
  end

  def show

  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
        redirect_to task_path
    else
        render :edit
    end
  end

  def destroy
    if current_user.id == @task.user.id
      @task.destroy
      redirect_to root_path
    end
  end

  def assign
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status_id, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def move_to_index
    set_task
    unless current_user.id ==  @task.user.id
      redirect_to root_path
    end
  end
end
