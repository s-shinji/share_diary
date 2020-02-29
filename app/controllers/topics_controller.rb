class TopicsController < ApplicationController
  # before_action :set_topic,:set_item
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
      redirect_to root_path
    else 
      flash.now[:alert] = "トピック名を入力してください"
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def topic_params
    params.require(:topic).permit(:name)
  end

  #  def set_topic
  #   @topic = Topic.find(params[:id])
  #  end

  #  def set_item
  #   @item = Item.find(params[:id])
  #  end
end
