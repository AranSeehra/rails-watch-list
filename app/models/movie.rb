class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy


  validates :title, uniqueness: true, length: { minimum: 2 }
  validates :overview, presence: true
end
