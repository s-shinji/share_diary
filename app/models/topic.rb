class Topic < ApplicationRecord
  validates :name, presence: true
  has_many :tweets
  has_many :comments
  has_many :favorites

  
  def self.search(input)
    return nil if input == ""
    Topic.where(['name LIKE ?', "%#{input}%"])
  end

  has_many :favorites, dependent: :destroy

  def favorite_user(user_id)
   favorites.find_by(user_id: user_id)
  end

end
