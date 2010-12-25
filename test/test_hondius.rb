require 'helper'

class TestWhatser < Test::Unit::TestCase
  def test_client
    assert Whatser.client.is_a?( Whatser::Client )
  end
  
  def test_client_cached
    client = Whatser.client
    assert_equal client.object_id, Whatser.client.object_id
  end
end
