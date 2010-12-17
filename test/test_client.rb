require 'helper'

class TestClient < Test::Unit::TestCase
  def test_attr_accessor
    client = SoGeo::Hondius::Client.new
    SoGeo::Hondius::Configuration::VALID_OPTIONS_KEYS.each do |a|
      assert client.respond_to?(a)
    end
  end
  
  def test_cattr_accessor
    SoGeo::Hondius::Configuration::VALID_OPTIONS_KEYS.each do |a|
      assert SoGeo::Hondius::Client.respond_to?(a)
    end
  end  
  
  def test_initialize_with_options
    params = {:api_key => '123', 
              :api_secret => 'abc', 
              :oauth_token => 'xyz',
              :api_uri => 'www.example.com',
              :username => 'test@example.com', 
              :password => 'test'}
              
    client = SoGeo::Hondius::Client.new( params )
    assert_equal params[:api_key], client.api_key
    assert_equal params[:api_secret], client.api_secret
    assert_equal params[:username], client.username
    assert_equal params[:password], client.password
  end
  
  def test_initialize_with_configure_defaults
    SoGeo::Hondius::Client.configure do |config|
      config.api_key = 'key'
      config.api_secret = 'secret'
      config.oauth_token = '123abc'
    end
    client = SoGeo::Hondius::Client.new  
    assert_equal 'key', client.api_key
    assert_equal 'secret', client.api_secret
    assert_equal '123abc', client.oauth_token
  end
  
  def test_resources
    client = SoGeo::Hondius::Client.new
    assert_equal SoGeo::Hondius::CheckIn, client.check_ins
    assert_equal SoGeo::Hondius::Collection, client.collections
    assert_equal SoGeo::Hondius::DataSource, client.data_sources
    assert_equal SoGeo::Hondius::Detail, client.details
    assert_equal SoGeo::Hondius::Media, client.media
    assert_equal SoGeo::Hondius::Poi, client.spots
    assert_equal SoGeo::Hondius::Subscription, client.subscriptions
    assert_equal SoGeo::Hondius::Tag, client.tags
    assert_equal SoGeo::Hondius::User, client.users    
    
    assert_equal client, client.check_ins.client
    assert_equal client, client.collections.client
    assert_equal client, client.data_sources.client
    assert_equal client, client.details.client
    assert_equal client, client.media.client
    assert_equal client, client.spots.client
    assert_equal client, client.subscriptions.client
    assert_equal client, client.tags.client
    assert_equal client, client.users.client
  end
end
