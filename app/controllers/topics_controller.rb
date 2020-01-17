class TopicsController < ApplicationController
    def index
        @topics = Topic.aplha_order
    end

    def show
        @topic = Topic.find_by(id: params[:id])
        @entries = current_user.entries.my_entries 
        #add scope method for my entries in this topic
    end 

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

    private
    def topic_params
        params.require(:topic).permit(:title, :topic_id, entries_attributes:[:date, :content, :topic_id, :user_id])
    end
end
