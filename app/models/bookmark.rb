class Bookmark < ApplicationRecord
  validates_format_of :url, with: URI.regexp(%w(http https)), message: 'Valid URL is required'
  validates :title, :url, :user_id, presence: true

  before_create :write_site

  belongs_to :site, optional: true
  has_many :bookmarks_tags
  has_many :tags, through: :bookmarks_tags

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
