require 'helper'

class TestFoursquare < Test::Unit::TestCase
  def test_key
    assert_equal 'foursquare', Whatser::Foursquare.new.key
  end
end