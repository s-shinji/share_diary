class CommentsController < ApplicationController
  before_action :set_topic
  before_action :set_tweet

  def create
    @comment = @tweet.comments.new(comment_params)
    @comments = @tweet.comments.includes(:user)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      @comments = @tweet.comments.includes(:user)
      render ("tweets/show.html.haml")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to  topic_tweet_path(@topic,@tweet)
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,tweet_id: params[:tweet_id],topic_id: params[:topic_id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end