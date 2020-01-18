class EntriesController < ApplicationController
  
    def index 
        @user = current_user
        @entries = current_user.entries.all
    end

    def show
        @entry = Entry.find_by(id: params[:id]) 
    end

    def new
        @topic = Topic.find_by(id: params[:id])
        @entry = Entry.new
        @entry.build_topic
    end

    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        redirect_to topic_entry_path(@entry.topic, @entry)
      else 
        render :new
      end
    end

    def edit
      @entry = Entry.find_by(id: params[:id])
    end

    def update
      @entry = Entry.find(params[:id])

      if @entry.update(entry_params)
      
      redirect_to entry_path(@entry)

      else
        render :edit
      end
    end

    def destroy
      @entry = Entry.find_by(id: params[:id])
      @entry.destroy 
      flash[:notice] = "Entry deleted."

      redirect_to entries_path(@entry)
    end

    private
    def entry_params
        params.require(:entry).permit(:date, :content, :entry_id, :topic_id, :user_id, 
            topic_attributes:[:title])
    end
end
