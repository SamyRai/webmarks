require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = Tag.new(name: 'blogs')
  end

  test 'should be valid' do
    assert @tag.valid?
  end

  test 'name should be present' do
    @tag.name = '      '

    assert_not @tag.valid?
  end

  test 'name should be unique' do
    Tag.create(name: 'blogs')

    assert_not @tag.valid?
  end
end
