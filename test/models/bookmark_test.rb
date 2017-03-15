require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: 'test@test.com', password: '1234')
    @bookmark = Bookmark.new(
      title: 'MasterCard',
      url: 'http://master.com',
      shortening: 'http://mat.er',
      user_id: @user.id, all_tags: 'Money, Gold, Card'
    )
    @site = Site.create(top_url: 'www.google.com')
  end

  test 'should be valid' do
    assert @bookmark.valid?
  end

  test 'title should be present' do
    @bookmark.title = '    '

    assert_not @bookmark.valid?
  end

  test 'url should be present' do
    @bookmark.url = '         '

    assert_not @bookmark.valid?
  end

  test 'user_id should be present' do
    @bookmark.user_id = nil

    assert_not @bookmark.valid?
  end

  test 'site should be assigned if exist' do
    @bookmark.url = 'http://www.google.com/asdfasdf'

    sites_before = Site.count

    @bookmark.save

    assert Site.count == sites_before
    assert @bookmark.site = @site
  end

  test 'site should be created if not exist' do
    sites_before = Site.count

    @bookmark.save

    assert Site.count > sites_before
    assert @bookmark.site.top_url = 'master.com'
  end
end
