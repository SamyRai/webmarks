require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  def setup
    @site = Site.new(top_url: 'www.namespace.com')
  end

  test 'should be valid' do
    assert @site.valid?
  end

  test 'top_url should be present' do
    @site.top_url = '      '
    assert_not @site.valid?
  end
end
