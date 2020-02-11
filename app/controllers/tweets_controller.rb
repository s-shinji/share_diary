class TweetsController < ApplicationController
  before_action :set_topic
  def index
    @tweets = @topic.tweets.includes(:user,:images).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
    @tweet.images.new
  end

  def create
    @tweet =  @topic.tweets.new(tweet_params)
    if @tweet.save
      redirect_to topic_tweets_path(@topic)
    else
      flash.now[:alert] = "タイトルとテキストを入力してください"
      render :new
    end

  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user) 
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to topic_tweets_path(@topic)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :content, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id,topic_id: params[:topic_id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

end
