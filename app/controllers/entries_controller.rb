class EntriesController < ApplicationController
    def index 
        @user = current_user
        @entries = @user.entries.all
    end

    def show
        @topic = Topic.find_by(id: params[:id])
        @entry = @topic.entry.find_by(date: params[:date])
    end

    def new
        @entry = Entry.new
        @entry.build_topic
    end

    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        redirect_to entry_path(@entry)
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
        params.require(:entry).permit(:date, :content, :topic_id, :user_id, 
            topic_attributes:[:title])
    end
end
