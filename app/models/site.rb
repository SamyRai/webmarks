class Site < ApplicationRecord
  validates :top_url, presence: true, uniqueness: true

  has_many :bookmarks
end
