class Bookmark < ApplicationRecord
  before_validation :write_site
  belongs_to :site
  has_many :bookmarks_tags
  has_many :tags, through: :bookmarks_tags
  validates :title, :url, :user_id, presence: true

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end

  private

  def write_site
    host = URI.parse(url).host
    self.site_id = Site.find_or_create_by(top_url: host).id
  end
end
