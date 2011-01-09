require 'helper'

class TestClient < Test::Unit::TestCase
  def test_attr_accessor
    client = Whatser::Client.new
    Whatser::Configuration::VALID_OPTIONS_KEYS.each do |a|
      assert client.respond_to?(a)
    end
  end
  
  def test_cattr_accessor
    Whatser::Configuration::VALID_OPTIONS_KEYS.each do |a|
      assert Whatser::Client.respond_to?(a)
    end
  end  
  
  def test_initialize_with_options
    params = {:api_key => '123', 
              :api_secret => 'abc', 
              :oauth_token => 'xyz',
              :api_uri => 'www.example.com',
              :username => 'test@example.com', 
              :password => 'test'}
              
    client = Whatser::Client.new( params )
    assert_equal params[:api_key], client.api_key
    assert_equal params[:api_secret], client.api_secret
    assert_equal params[:username], client.username
    assert_equal params[:password], client.password
  end
  
  def test_initialize_with_configure_defaults
    Whatser::Client.configure do |config|
      config.api_key = 'key'
      config.api_secret = 'secret'
      config.oauth_token = '123abc'
    end
    client = Whatser::Client.new  
    assert_equal 'key', client.api_key
    assert_equal 'secret', client.api_secret
    assert_equal '123abc', client.oauth_token
  end
  
  def test_resources
    client = Whatser::Client.new
    assert_equal Whatser::CheckIn, client.check_ins
    assert_equal Whatser::Collection, client.collections
    assert_equal Whatser::DataSource, client.data_sources
    assert_equal Whatser::Detail, client.details
    assert_equal Whatser::Media, client.media
    assert_equal Whatser::Poi, client.spots
    assert_equal Whatser::Subscription, client.subscriptions
    assert_equal Whatser::Tag, client.tags
    assert_equal Whatser::User, client.users    
    assert_equal Whatser::Follow, client.follows
    assert_equal Whatser::Facebook, client.facebook
    assert_equal Whatser::Foursquare, client.foursquare
    assert_equal Whatser::Gowalla, client.gowalla
    assert_equal Whatser::Twitter, client.twitter
    
    assert_equal client, client.check_ins.client
    assert_equal client, client.collections.client
    assert_equal client, client.data_sources.client
    assert_equal client, client.details.client
    assert_equal client, client.media.client
    assert_equal client, client.spots.client
    assert_equal client, client.subscriptions.client
    assert_equal client, client.tags.client
    assert_equal client, client.users.client
    assert_equal client, client.follows.client
    assert_equal client, client.facebook.client
    assert_equal client, client.foursquare.client
    assert_equal client, client.gowalla.client
    assert_equal client, client.twitter.client
  end
  
  def test_authorized
    client = Whatser::Client.new
    assert_equal false, client.authorized?
    
    client.oauth_token = 'test'
    assert_equal true, client.authorized?
  end
end
