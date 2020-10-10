class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postalcode, :prefecture, :city, :house_number, presence: true
end
