class TasksController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]
    before_action :set_task, only: [:show, :destroy, :edit, :update]
    before_action :move_to_index, only: [:edit, :update]

    def index
        @tasks = Task.index_all.page(params[:page])
    end

    def new
        @task = Task.new
    end

    def show

    end

    def create
        binding.pry
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

    end

    def destroy

    end

    private

    def task_params
        params.require(:task).permit(:title, :content, :deadline, :status_id).merge(user_id: current_user.id)
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