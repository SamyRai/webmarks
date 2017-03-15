class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :bookmarks_tags
  has_many :bookmarks, through: :bookmarks_tags
end
