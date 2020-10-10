class Image < ApplicationRecord
<<<<<<< HEAD
  mount_uploader :src, ImageUploader
  belongs_to :item
end
=======
  belongs_to :item

  validates :src, presence: true
  mount_uploader :src, ImageUploader
end
>>>>>>> origin
