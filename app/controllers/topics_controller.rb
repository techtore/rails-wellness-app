class TopicsController < ApplicationController

    def show
        @topic = Topic.find_by(title: params[:title])
    end

    def new
        @topic = Topic.new
        @entry = @topic.entries.build
    end 

    def create
        topic = Topic.find_by(title: params[:title])
        if !topic 
            topic = topic.create(topic_params)
        end 
        redirect_to topic_path(topic)
    end

    def edit
    end

    def update
    end

    private
    def topic_params
        params.require(:topics).permit(:title, entries_attributes:[:date, :content])
    end
end
