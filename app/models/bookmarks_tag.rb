class BookmarksTag < ApplicationRecord
  belongs_to :bookmark
  belongs_to :tag
end
