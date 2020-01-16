class TopicsController < ApplicationController

    def index
        if current_user
            @topics = Topic.all
        end
    end

    def show
      
    end

    def new
       
    end 

    def create
         
    end

    def edit
    end

    def update
    end

    private
    def topic_params
        params.require(:topics).permit(:title, entries_attributes:[:date, :content, :topic_id, :user_id])
    end
end
