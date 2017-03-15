require 'test_helper'

class RootPageBehaviourTest < ActionDispatch::IntegrationTest
  def setup
    @sess_params = { session: { email: 'anem@dfmdf.co', password: 'asdfsf' } }
  end

  test 'should show login page when not authorized' do
    get '/'
    assert_redirected_to login_url
  end

  test 'should render bookmarks#index' do
    assert_generates '/', controller: 'bookmarks', action: 'index'
  end
end
