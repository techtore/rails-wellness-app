class EntriesController < ApplicationController
    def index 
        @user = current_user
        @entries = Entry.all
    end

    def show
        @entry = Entry.find_by(id: params[:id])
    end

    def new
        @topic = Topic.find_by(topic_id: params[:topic_id])
        @entry = Entry.new
        @entry.build_topic
    end

    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        redirect_to entry_path(@entry)
        binding.pry
      else 
        render :new
        
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
        params.require(:entry).permit(:date, :content, :entry_id, :topic_id, :user_id, 
            topic_attributes:[:title])
    end
end
