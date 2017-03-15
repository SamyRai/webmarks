class Site < ApplicationRecord
  validates :top_url, presence: true

  has_many :bookmarks
end
