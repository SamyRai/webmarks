require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: 'anem@dfmdf.co', password: 'asdfsf')
    @sess_params = { session: { email: @user.email, password: @user.password } }
  end

  test 'root should refer to bookmarks#index' do
    assert_routing '/', controller: 'bookmarks', action: 'index'
  end

  test 'should be redirected to login page if not authorized' do
    delete logout_url
    get bookmarks_url
    assert_redirected_to login_url
  end

  test 'should get index if authorized' do
    post login_url, params: @sess_params
    get bookmarks_url
    assert_response :success
  end
end
