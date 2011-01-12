require 'helper'

class TestSubscription < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:oauth_token => '1234')
  end
  
  def test_list
    assert @client.subscriptions.list( :page => 1, :per_page => 10 ).is_a?(Whatser::Response)
  end
end