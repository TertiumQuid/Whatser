require 'helper'

class TestCity < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new(:oauth_token => '1234')
    @user_id = 1
  end
  
  def test_my_cities
    assert @client.cities.mine( :page => 1, :per_page => 10 ).is_a?(Whatser::Response)
  end
  
  def test_user_cities
    assert @client.cities.user( @user_id, :page => 1, :per_page => 10 ).is_a?(Whatser::Response)
  end
end