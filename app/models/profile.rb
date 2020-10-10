class Profile < ApplicationRecord
  belongs_to :user, optional: true

  VALID_ZENKAKU_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :familyname, :firstname, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :familykana, :firstkana, :birthdate, presence: true, format: { with: VALID_KANA_REGEX }


end
