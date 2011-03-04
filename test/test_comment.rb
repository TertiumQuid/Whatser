require 'helper'

class TestComment < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @poi_id = 1
    @media_id = 1    
    @user_id = 1
    @comment = Whatser::Comment.new(:poi_id => @poi_id, :body => 'test', :user_id => @user_id)
  end
  
  def test_poi
    assert @comment.poi.is_a?(Whatser::Response)
    @comment.poi_id = nil
    assert_nil @comment.poi
  end
  
  def test_user
    assert @comment.user.is_a?(Whatser::Response)
    @comment.user_id = nil
    assert_nil @comment.user
  end
  
  def test_poi_list
    assert @client.comments.poi(@poi_id, :page => 1).is_a?(Whatser::Response)
  end
  
  def test_media_list
    assert @client.comments.media(@media_id, :page => 1).is_a?(Whatser::Response)
  end  
  
  def test_create
    assert @client.comments.create('poi', @poi_id, 'testing.').is_a?(Whatser::Response)
  end
  
  def test_delete
    assert @client.comments.delete(@poi_id).is_a?(Whatser::Response)
    assert @comment.delete.is_a?(Whatser::Response)
  end  
end