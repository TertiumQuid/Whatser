require 'helper'

class TestHondius < Test::Unit::TestCase
  def test_client
    assert SoGeo::Hondius.client.is_a?( SoGeo::Hondius::Client )
  end
  
  def test_client_cached
    client = SoGeo::Hondius.client
    assert_equal client.object_id, SoGeo::Hondius.client.object_id
  end
end
