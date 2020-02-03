class Tweet < ApplicationRecord
  validates :content, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  has_many :likes, dependent: :destroy

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
