class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 12 }
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo
end
