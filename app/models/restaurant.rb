class Restaurant < ApplicationRecord

  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, length: { minimum: 1 }
  validates :phone_number, presence: true, length: { minimum: 1 }
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
