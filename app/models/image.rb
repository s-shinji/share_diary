class Image < ApplicationRecord
  belongs_to :tweet

  mount_uploader :src, ImageUploader
end
