require 'helper'

class TestDataSource < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:oauth_token => '1234')
  end
  
  def test_list
    assert @client.check_ins.list(:page => 1).is_a?(Whatser::Response)
  end
    
  def test_subscription_url
    datasource = @client.data_sources.new(:id => '1')
    expected = "#{@client.api_uri}/payments/data_sources/1/orders/new?oauth_token=1234"
    assert_equal expected, datasource.subscription_url
  end
  
  def test_subscription_url_with_params  
    datasource = @client.data_sources.new(:id => '1')
    expected = "#{@client.api_uri}/payments/data_sources/1/orders/new?oauth_token=1234&test=2&extra=1"
    assert_equal expected, datasource.subscription_url(:extra => 1, :test => 2)
  end
end