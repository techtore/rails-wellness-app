class TopicsController < ApplicationController

    def show
        @topic = Topic.find_by(id: params[:id])
    end

    def new
        @topic = Topic.new
        @entry = @topic.entries.build
    end 

    def create
        topic = Topic.new(id: params[:id])
        if topic.save 
            redirect_to topic_path(topic)
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
