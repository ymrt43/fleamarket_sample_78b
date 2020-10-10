class Image < ApplicationRecord

  belongs_to :item

  validates :src, presence: true
  mount_uploader :src, ImageUploader
end

