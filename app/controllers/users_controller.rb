class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_tweet
  before_action :set_topic

  def show
    @user = User.find(params[:id])
  end

  private
  def set_tweet
    @tweets = Tweet.find(params[:id])
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
