require 'helper'

class TestFacebook < Test::Unit::TestCase
  def test_key
    assert_equal 'facebook', Whatser::Facebook.new.key
  end
end