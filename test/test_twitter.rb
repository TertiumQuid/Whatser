require 'helper'

class TestTwitter < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:oauth_token => '1234')
  end
  
  def test_key
    assert_equal 'twitter', Whatser::Twitter.new.key
  end

  def test_connection_url
    expected = "#{@client.api_uri}/oauth/services/twitter/authorize?redirect_uri=&client_id="
    assert_equal expected, @client.twitter.connection_url
  end  
  
  def test_get_friends
    assert @client.twitter.get_friends(:opt => 'test').is_a?(Whatser::Response)
  end  
end