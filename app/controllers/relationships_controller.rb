class RelationshipsController < ApplicationController
  before_action :set_user
  def create
    following = current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    following = current_user.unfollow(@user)
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end
