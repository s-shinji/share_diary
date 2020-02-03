class TopicsController < ApplicationController
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

end
