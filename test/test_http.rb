require 'helper'

class TestHttp < Test::Unit::TestCase  
  def setup
    @client = Whatser.client
  end
  
  def test_request_options_default
    @client.oauth_token = '123'
    expected = {:query => {:oauth_token => '123'}, :body => nil}
    assert_equal expected, @client.send(:request_options)
  end
  
  def test_request_options_with_query
    @client.oauth_token = '123'
    expected = {:query => {:oauth_token => '123', :extra => 1}, :body => nil}
    assert_equal expected, @client.send(:request_options, {:query => {:extra => 1} })
  end  
  
  def test_request_options_with_body
    @client.oauth_token = '123'
    expected = {:query => {:oauth_token => '123'}, :body => {:extra => 1}}
    assert_equal expected, @client.send(:request_options, {:body => {:extra => 1} })
  end  
  
  def test_base_uri_on_included
    assert_equal @client.api_uri, Whatser::Http.base_uri
  end
  
  def test_request
    response = @client.request(:get, '/', {})
    assert response.is_a?(Whatser::Response)
  end
  
  def test_compose_url
    path = '/api/endpoint'
    uri = @client.api_uri
    assert_equal "#{uri}#{path}", @client.send(:compose_url, path)
  end
end
