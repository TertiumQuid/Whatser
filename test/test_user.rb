require 'helper'

class TestUser < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @user = Whatser::User.new
  end

  def test_to_params
    user = Whatser::User.new
    params = [:name,:avatar_pic,:location,:bio,:email]
    params.each do |p|
      assert user.to_params.keys.include?(p)
    end
  end  

  def test_me
    assert @client.users.me.is_a?(Whatser::Response)
  end
  
  def test_suggested
    assert @client.users.suggested.is_a?(Whatser::Response)
  end  
  
  def test_visitors
    assert @client.users.visitors(1).is_a?(Whatser::Response)
  end
  
  def test_collectors
    assert @client.users.collectors(1).is_a?(Whatser::Response)
  end    
  
  def test_find
    assert @client.users.find(1, :opt => 'test').is_a?(Whatser::Response)
  end
  
  def test_search
    assert @client.users.search(:opt => 'test').is_a?(Whatser::Response)
  end    
  
  def test_anonymous
    assert @client.users.anonymous.is_a?(Whatser::Response)
  end  
  
  def test_invite
    assert @client.users.invite( :emails => 'first@example.com;second@example.com' ).is_a?(Whatser::Response)
  end  
  
  def test_create
    assert @client.users.create(:name => 'test', :email => 'test@example.com', :password => '123pass').is_a?(Whatser::Response)
  end
  
  def test_connection
    assert @user.connection.is_a?(Whatser::Response)
  end  
  
  def test_followers
    assert @user.followers.is_a?(Whatser::Response)
  end  

  def test_thanks
    assert @user.thanks(1, :opt => 'test').is_a?(Whatser::Response)
  end  
  
  def test_save
    assert @user.save.is_a?(Whatser::Response)
  end  
  
  def test_save_and_update
    @user.id = 1
    assert @user.save.is_a?(Whatser::Response)
  end  
end