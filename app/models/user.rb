class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sell_items, -> { where("buyer_id is NULL") }, foreign_key: "user_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "user_id", class_name: "Item"

  has_one :profile, dependent: :destroy, validate: true
  accepts_nested_attributes_for :profile

  has_one :address, dependent: :destroy, validate: true
  accepts_nested_attributes_for :address

  has_one :card

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    where(conditions).first
  end 

end
