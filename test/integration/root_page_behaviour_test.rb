require 'test_helper'

class RootPageBehaviourTest < ActionDispatch::IntegrationTest
  test "should show login page when not authorized" do
    get '/'
    assert_redirected_to login_url
  end
end
