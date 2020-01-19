class EntriesController < ApplicationController
  
    def search 
      if params[:search]
        @entries = current_user.entries.searched(params[:search])
      else
        @entries = current_user.entries
      end
    end

    def index 
      @user = current_user
      @entries = current_user.entries
      # if params[:search]
      #   @entries = current_user.entries.searched(params[:search])
     
      # else
      #   @entries = current_user.entries
      # end
        
    end

    def show
        @entry = current_user.entries.find_by(id: params[:id]) 
    end

    def new
        @topic = Topic.find_by(id: params[:id])
        @entry = current_user.entries.build
        @entry.build_topic
    end

    def create
      @entry = current_user.entries.build(entry_params)
      if @entry.save
        redirect_to topic_entry_path(@entry.topic, @entry)
      else 
        render :new
      end
    end

    def edit
      @entry = current_user.entries.find_by(id: params[:id])
    end

    def update
      @entry = current_user.entries.find(params[:id])

      if @entry.update(entry_params)
      
      redirect_to entry_path(@entry)

      else
        render :edit
      end
    end

    def destroy
      @entry = current_user.entries.find_by(id: params[:id])
      @entry.destroy 

      redirect_to entries_path(@entry)
    end

    private
    def entry_params
        params.require(:entry).permit(:date, :content, :keyword, :entry_id, :topic_id, :user_id, 
            topic_attributes:[:title])
    end
end
