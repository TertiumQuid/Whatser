require 'helper'

class TestFollow < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @user_id = 1
    @follow = Whatser::Follow.new(:id => @user_id)
  end
 
  def test_list
    assert @client.follows.list(:page => 1).is_a?(Whatser::Response)
  end
  
  def test_followers
    assert @client.follows.followers(@user_id, :page => 1).is_a?(Whatser::Response)
  end  
  
  def test_suggested
    assert @client.follows.suggested(:page => 1).is_a?(Whatser::Response)
  end  

  def test_create
    assert @client.follows.create(@user_id).is_a?(Whatser::Response)
  end

  def test_delete
    assert @client.follows.delete(@user_id).is_a?(Whatser::Response)
  end

  def test_ignore
    assert @client.follows.ignore(@user_id).is_a?(Whatser::Response)
  end  

  def test_save
    assert @follow.save.is_a?(Whatser::Response)
  end
end