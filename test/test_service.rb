require 'helper'

class TestService < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:api_key => '123', :redirect_uri => 'http://example.com')
    @service = Whatser::Service.set(@client).new
  end
  
  def test_key
    assert_equal 'service', Whatser::Service.key
    assert_equal 'service', @service.key
  end

  def test_connection_url
    expected = "#{@client.api_uri}/oauth/services/service/authorize?"
    expected = expected + "client_id=#{@client.api_key}&redirect_uri=#{ CGI.escape(@client.redirect_uri) }"
    assert_equal expected, @service.connection_url
  end  
  
  def test_disconnection_url
    expected = "#{@client.api_uri}/oauth/services/service/disconnect"
    assert_equal expected, @service.disconnection_url
  end  
  
  def test_auth_params
    expected = {:client_id => @client.api_key, :redirect_uri => @client.redirect_uri}
    assert_equal expected, Whatser::Service.auth_params
  end
  
  def test_auth_params_with_params
    override_url = 'http://sub.example.com'
    expected = {:client_id => @client.api_key, :redirect_uri => override_url}
    assert_equal expected, Whatser::Service.auth_params(:redirect_uri => override_url)
  end
  
  def test_connection_querystring
    expected = "client_id=#{@client.api_key}&redirect_uri=#{ CGI.escape(@client.redirect_uri) }"
    assert_equal expected, Whatser::Service.connection_querystring
  end
  
  def test_connection_querystring_with_params
    expected = "display=wap&client_id=#{@client.api_key}&redirect_uri=#{ CGI.escape(@client.redirect_uri) }"
    assert_equal expected, Whatser::Service.connection_querystring(:display => 'wap')
  end  
end