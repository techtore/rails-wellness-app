class EntriesController < ApplicationController
    def show 
        @topic = Topic.find_by(id: params[:id])
        @entries = @topic.entries.all
    end

    def new
        @topic = Topic.new
        @entry = @topic.entries.build
    end

    def create
        topic = Topic.new(id: params[:id])
        if topic.save 
            redirect_to entry
        end  
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def entry_params
        params.require(:entry).permit(:date, :content, :topic_id, :user_id)
    end
end
