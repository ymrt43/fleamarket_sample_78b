class Address < ApplicationRecord
  belongs_to :user, optional: true

  VALID_PCODE_REGEX = /\A\d{7}\z/

  validates :postalcode, presence: true, format: { with: VALID_PCODE_REGEX }
  validates :prefecture, :city, :house_number, presence: true
end
