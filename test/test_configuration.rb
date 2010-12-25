require 'helper'

class TestConfiguration < Test::Unit::TestCase
  def reset_defaults
    Whatser::Client.configure do |config|
      config.api_key = nil
      config.api_secret = nil
      config.oauth_token = nil
    end    
  end
  
  def test_valid_options_keys
    expected = [:api_key,:api_secret,:username,:password,:oauth_token,:api_uri,:redirect_uri]
    assert_equal expected, Whatser::Configuration::VALID_OPTIONS_KEYS
  end
  
  def test_defaults_on_inclusion
    reset_defaults
    client = Whatser::Client.new
    assert_equal nil, client.api_key
    assert_equal nil, client.api_secret
    assert_equal nil, client.oauth_token
    assert_equal nil, client.redirect_uri
    assert_equal Whatser::Configuration::DEFAULT_API_URI, client.api_uri
  end
end