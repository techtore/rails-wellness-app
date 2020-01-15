class UsersController < ApplicationController

    def show 
        @user = current_user
        @topics = @user.topics.all
    end
    private

    def user_params
        params.require(:user).permit(:name, topics_attributes:[:title])
    end
end
