require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: 'anem@dfmdf.co', password: 'asdfsf')
  end

  test "should be redirected to login page if not authorized" do
    delete logout_url
    get tags_url

    assert_redirected_to login_url
  end

  test "should get index if authorized" do
    post login_url, params: { session: { email: 'anem@dfmdf.co', password: 'asdfsf' } }
    get tags_url

    assert_response :success
  end
end
