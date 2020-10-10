class Profile < ApplicationRecord
  belongs_to :user, optional: true

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ァ-ンー－]+\z/

  validates :familyname, :firstname, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :familykana, :firstkana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birthdate, presence: true
end
