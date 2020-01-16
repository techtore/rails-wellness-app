class UsersController < ApplicationController

    private

    def user_params
        params.require(:user).permit(:name, topics_attributes:[:title])
    end
end
