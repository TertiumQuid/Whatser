require 'helper'

class TestActivityFeed < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:oauth_token => '1234')
    @user_id = 1
  end
  
  def test_my_feed
    assert @client.feeds.mine( :page => 1, :per_page => 10 ).is_a?(Whatser::Response)
  end
  
  def test_user_feed
    assert @client.feeds.user( @user_id, :page => 1, :per_page => 10 ).is_a?(Whatser::Response)
  end
  
  def test_global_feed
    assert @client.feeds.global( :page => 1, :per_page => 10 ).is_a?(Whatser::Response)
  end  
end