require 'helper'

class TestFoursquare < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:oauth_token => '1234')
  end

  def test_key
    assert_equal 'foursquare', Whatser::Foursquare.new.key
  end

  def test_connection_url
    expected = "#{@client.api_uri}/oauth/services/foursquare/authorize?redirect_uri=&client_id="
    assert_equal expected, @client.foursquare.connection_url
  end
  
  def test_get_friends
    assert @client.foursquare.get_friends(:opt => 'test').is_a?(Whatser::Response)
  end  
end