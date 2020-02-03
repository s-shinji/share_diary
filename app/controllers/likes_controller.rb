class LikesController < ApplicationController
  before_action :set_tweet
  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweet.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.destroy
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweet.reload
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  # def set_topic
  #   @topic = Topic.find(params[:topic_id])
  # end
end
