require 'helper'

class TestGowalla < Test::Unit::TestCase
  def test_key
    assert_equal 'gowalla', Whatser::Gowalla.new.key
  end
end