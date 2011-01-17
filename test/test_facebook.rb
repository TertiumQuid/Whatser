require 'helper'

class TestFacebook < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:oauth_token => '1234')
  end
  
  def test_key
    assert_equal 'facebook', Whatser::Facebook.new.key
  end
  
  def test_connection_url
    expected = "#{@client.api_uri}/oauth/services/facebook/authorize"
    assert_equal expected, @client.facebook.connection_url
  end
end