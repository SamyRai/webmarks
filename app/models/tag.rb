class Tag < ApplicationRecord
  has_many :bookmarks_tags
  has_many :bookmarks, through: :bookmarks_tags
end
