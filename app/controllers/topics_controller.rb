class TopicsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @topics = Topic.order(:title)
    end

    def show
        @topic = Topic.find_by(id: params[:id])
        @entries = current_user.entries  
    end 

    def new
       @topic = Topic.new
    end 

    def create
       @topic = Topic.new(topic_params)
       if @topic.valid?
        @topic.save
        redirect_to @topic  
       else 
        # topic.present?
        #     flash[:notice] = "Topic all ready exists "

        render :new
       end
    end

    private
    def topic_params
        params.require(:topic).permit(:title, :topic_id, entries_attributes:[:date, :content, :keyword, :topic_id, :user_id])
    end
end
