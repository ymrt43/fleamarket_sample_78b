class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :comments
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :category
  belongs_to :buyer, class_name: "User", optional: true, foreign_key: "buyer_id"
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :description, :state, :fee, :term, :price, presence: true

  enum state: {
    "新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3,
    "やや汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6
  }

  enum fee: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2 }

  enum term: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3 }

end
