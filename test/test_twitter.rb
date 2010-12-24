require 'helper'

class TestTwitter < Test::Unit::TestCase
  def test_key
    assert_equal 'twitter', Whatser::Twitter.new.key
  end
end