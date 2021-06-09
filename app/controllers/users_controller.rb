class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @tasks = Task.where(user_id: current_user.id, status: [:backlog,:wip]).page(params[:page]).per(6)
  end
end
