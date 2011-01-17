require 'helper'

class TestGowalla < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:oauth_token => '1234')
  end
  
  def test_key
    assert_equal 'gowalla', Whatser::Gowalla.new.key
  end

  def test_connection_url
    expected = "#{@client.api_uri}/oauth/services/gowalla/authorize"
    assert_equal expected, @client.gowalla.connection_url
  end  
end