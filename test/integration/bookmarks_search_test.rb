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

  test 'search when no bookmarks found' do
    post login_url, params: @sess_params
    get '/'
    assert_select "h1", 'Bookmarks [Add]'
    get search_path, params: {query: 'Blogs'}
    assert_select "p", 'No bookmarks found by request "Blogs"'
  end

  test 'search when bookmark found by name' do
    post login_url, params: @sess_params
    get '/'

    assert_select "h1", 'Bookmarks [Add]'
    get search_path, params: {query: 'MasterCard'}
    assert_select "td", 'MasterCard'
  end

  test 'search when bookmark found by shortening' do
    post login_url, params: @sess_params
    get '/'

    assert_select "h1", 'Bookmarks [Add]'
    get search_path, params: {query: 'mat.er'}
    assert_select "td", 'MasterCard'
  end

  test 'search when bookmark found by url' do
    post login_url, params: @sess_params
    get '/'

    assert_select "h1", 'Bookmarks [Add]'
    get search_path, params: {query: 'http://master.com'}
    assert_select "td", 'MasterCard'
  end
end
