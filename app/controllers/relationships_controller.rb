class RelationshipsController < ApplicationController
  before_action :set_user
  # before_action :set_user_id
  # before_action :set_topic
  # before_action :set_tweet

  def create
    user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(user)
    redirect_to user
    # if following.save
    #   flash[:success] = 'ユーザーをフォローしました'
    #   redirect_to user
    # else
    #   flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    #   redirect_to user
    # end
  end

  def destroy
    user = User.find(params[:relationship][:follow_id])
    following = current_user.unfollow(user)
    redirect_to user
    # if following.destroy
    #   flash[:success] = 'ユーザーのフォローを解除しました'
    #   redirect_to user
    # else
    #   flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    #   redirect_to user
    # end
  end

  private

  def set_user
    user = User.find(params[:relationship][:follow_id])
  end

  # def set_user_id
  #   @user = User.find(params[:user_id])
  # end

  # def set_topic
  #   @topic = Topic.find(params[:topic_id])
  # end

  # def set_tweet
  #   @tweet = Tweet.find(params[:tweet_id])
  # end


end
