class TopicsController < ApplicationController

    def index
        if current_user
            @topics = Topic.all
        end
    end

    def show
      @topic = Topic.find_by(id: params[:id])
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

    def edit
    end

    def update
    end

    private
    def topic_params
        params.require(:topics).permit(:title, entries_attributes:[:date, :content, :topic_id, :user_id])
    end
end
