class TopController < ApplicationController
  before_action :authenticate_user!, except: [:index,:new_guest]
  def index
  end
  
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to topics_path, notice: 'ゲストユーザーでログインしました。'
  end
end
