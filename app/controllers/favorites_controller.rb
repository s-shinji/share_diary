class FavoritesController < ApplicationController
  before_action :set_topic

  def create
    @favorite = Favorite.create(user_id: current_user.id, topic_id: params[:topic_id])
    @favorites = Favorite.where(topic_id: params[:topic_id])
    @topic.reload
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    favorite.destroy
    @favorites = Favorite.where(topic_id: params[:topic_id])
    @topic.reload
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end