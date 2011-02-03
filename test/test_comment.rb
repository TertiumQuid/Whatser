require 'helper'

class TestComment < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @poi_id = 1
    @media_id = 1    
    @comment = Whatser::Comment.new(:poi_id => @poi_id, :body => 'test')
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