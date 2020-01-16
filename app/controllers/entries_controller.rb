class EntriesController < ApplicationController
    def show 
        @topic = Topic.find_by(id: params[:id])
        @entries = @topic.entries.all
    end

    def new
        @entry = Entry.new
        @entry.build_topic
    end

    def create
      @entry = Entry.new(entry_params)
      @entry.user_id = session[:user_id]
      if @entry.save!
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
