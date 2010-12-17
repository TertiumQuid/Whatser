require 'helper'

class TestHttp < Test::Unit::TestCase  
  def setup
    @client = SoGeo::Hondius.client
  end
  
  def test_default_options
    @client.oauth_token = '123'
    expected = {:query => {:oauth_token => '123'}, :body => {}}
    assert_equal expected, @client.send(:default_request_options)
  end
  
  def test_base_uri_on_included
    assert_equal @client.api_uri, SoGeo::Hondius::Http.base_uri
  end
  
  def test_request
  end
end
