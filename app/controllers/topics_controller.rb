class TopicsController < ApplicationController

    def new
       @topic = Topic.new
    end 

    def create
       topic = Topic.new(topic_params)
       if topic.save
        redirect_to topic  
       else 
        render :new
       end
    end

    def edit
    end

    def update
    end

    private
    def topic_params
        params.require(:topic).permit(:title, :topic_id, entries_attributes:[:date, :content, :topic_id, :user_id])
    end
end
