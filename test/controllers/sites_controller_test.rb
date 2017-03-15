require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: 'anem@dfmdf.co', password: 'asdfsf')
    @sess_params = { session: { email: 'anem@dfmdf.co', password: 'asdfsf' } }
  end

  test 'should be redirected to login page if not authorized' do
    delete logout_url
    get sites_url

    assert_redirected_to login_url
  end

  test 'should get index if authorized' do
    post login_url, params: @sess_params
    get sites_url

    assert_response :success
  end
end
