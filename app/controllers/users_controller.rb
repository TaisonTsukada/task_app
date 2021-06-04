class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @tasks = Task.where(user_id: current_user.id)
    end
end
