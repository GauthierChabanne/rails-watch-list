class Movie < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
  validates :rating, presence: true
  has_many :bookmarks, dependent: :destroy
end
