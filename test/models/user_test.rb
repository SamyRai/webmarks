require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'name1@surname1.com', password: '12345')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'email should be present' do
    @user.email = '      '
    assert_not @user.valid?
  end

  test 'email should be valid email' do
    @user.email = 'not_an_email'
    assert_not @user.valid?
  end

  test 'email should be unique' do
    User.create(email: 'name1@surname1.com', password: '12345')
    assert_not @user.valid?
  end

  test 'password should be present' do
    @user.password = '      '
    assert_not @user.valid?
  end
end
