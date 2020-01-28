class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:show, :edit, :update, :destroy ]

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
    end

    def show
      @entry = current_user.entries.find_by(id: params[:id]) 
    end

    def new 
      @topic = Topic.find_by(id: params[:topic_id]) 
      @entry = current_user.entries.build
    end

    def create
      @topic = Topic.find_by(id: params[:topic_id])
      @entry = current_user.entries.build(entry_params)
      @entry.topic = @topic
      if @entry.save
        redirect_to topic_entry_path(@entry.topic, @entry)
      else 
        render :new
      end
    end

    def edit
    end

    def update
      if @entry.update(entry_params)
      
      redirect_to entry_path(@entry)

      else
        render :edit
      end
    end

    def destroy
      @entry.destroy 

      redirect_to entries_path(@entry)
    end

    private
    def entry_params
        params.require(:entry).permit(:date, :content, :keyword, :topic_id, :user_id, 
            topic_attributes:[:title])
    end

    def set_entry
      @entry = current_user.entries.find_by(id: params[:id])
    end
    
end
