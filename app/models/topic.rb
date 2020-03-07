class Topic < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25}
  has_many :user_topics
  has_many :users, through: :user_topics
  has_many :tweets
  has_many :comments

  
  def self.search(input)
    return nil if input == ""
    Topic.where(['name LIKE ?', "%#{input}%"])
  end

  has_many :favorites, dependent: :destroy

  def favorite_user(user_id)
   favorites.find_by(user_id: user_id)
  end

end
