class Item < ApplicationRecord
  has_many :images
  has_many :comments
  belongs_to :user
  belongs_to :category
  belongs_to :buyer, class_name: "User"

  validates :name, :description, :state, :fee, :area, :term, :price, :user_id, category_id, presence: true
end
