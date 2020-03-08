class TopicsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @topic = Topic.all
    @topics = Topic.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else 
      flash.now[:alert] = "トピック名を入力してください"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:name)
  end
end
