require 'helper'

class TestOauth < Test::Unit::TestCase
  def test_oauth_client
    params = {:api_key => '123', :api_secret => '123', :api_uri => 'http://example.com'}
    client = SoGeo::Hondius::Client.new(params)
    oauth = client.oauth_client
    assert oauth.is_a?(OAuth2::Client)
    assert_equal params[:api_key], oauth.id
    assert_equal params[:api_secret], oauth.secret
    assert_equal params[:api_uri], oauth.site
  end
  
  def test_oauth_authorize_url
    base = 'http://example.com/oauth/authorize'
    client = SoGeo::Hondius::Client.new(:api_uri => base, :api_key => '123')
    assert_equal "#{base}?client_id=123&type=web_server", client.oauth_authorize_url
    assert_equal "#{base}?client_id=123&type=web_server&redirect_uri=http%3A%2F%2Fexample.com%2Foauth%2Fauthorize", client.oauth_authorize_url(:redirect_uri => base)
  end
  
  def test_hash_to_query
    client = SoGeo::Hondius::Client.new
    assert_equal ["first=1","second=2"].sort, client.send(:hash_to_query, {:first => 1, :second => 2}).split('&').sort
    assert_equal "", client.send(:hash_to_query, {} ) 
  end
end
