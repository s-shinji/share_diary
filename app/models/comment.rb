class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  belongs_to :topic
end
