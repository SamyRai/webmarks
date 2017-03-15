require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: 'anem@dfmdf.co', password: 'asdfsf')
    @sess_params = { session: { email: @user.email, password: @user.password } }
    @bookmark = Bookmark.create(
      title: 'MasterCard',
      url: 'http://master.com',
      shortening: 'http://mat.er',
      user_id: @user.id, all_tags: 'Money, Gold, Card'
    )
  end

  test 'tag with no bookmarks found' do
    post login_url, params: @sess_params
    get '/'

    get tag_bookmarks_url(Tag.create(name: 'Stress').id)
    assert_select 'p', 'No bookmarks yet'
  end

  test 'tag with bookmark found' do
    post login_url, params: @sess_params
    get '/'

    get tag_bookmarks_url(Tag.last.id)
    assert_select 'td', 'MasterCard'
  end
end
