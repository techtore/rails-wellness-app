class EntriesController < ApplicationController
    def index 
        @user = current_user
        @entries = Entry.all
    end

    def show
        @entry = Entry.find_by(id: params[:id])
        @topic = Topic.
    end

    def new
        @topic = Topic.find_by(id: params[:id])
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
      @entry = Entry.find_by(id: params[:id])
    end

    def update
      @entry = Entry.update(entry_params)
      if @entry.save
      redirect_to entry_path(@entry)
      end
    end

    def destroy
    end

    private
    def entry_params
        params.require(:entry).permit(:date, :content, :entry_id, :topic_id, :user_id, 
            topic_attributes:[:title])
    end
end
