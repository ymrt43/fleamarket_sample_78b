class Address < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  VALID_PCODE_REGEX = /\A\d{7}\z/

  validates :postalcode, presence: true, format: { with: VALID_PCODE_REGEX }
  validates :prefecture, :city, :house_number, presence: true
end
