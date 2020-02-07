class UsersController < ApplicationController
  before_action :set_tweet
  before_action :set_topic
  def show
    @user = User.find(params[:id])
  end

  private
  def set_tweet
    @tweets = Tweet.find(params[:tweet_id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

end
