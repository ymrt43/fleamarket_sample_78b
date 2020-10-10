class Item < ApplicationRecord
  has_many :images
  has_many :comments
  belongs_to :user
  belongs_to :category
<<<<<<< HEAD
  belongs_to :buyer, class_name: "User"
=======
  belongs_to :buyer, class_name: "User", optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :description, :state, :fee, :area, :term, :price, presence: true

  enum state: {
    "新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3,
    "やや汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6
  }

  enum fee: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2 }

  enum term: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3 }

>>>>>>> origin
end
