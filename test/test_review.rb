require 'helper'

class TestReview < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @poi_id = 1
    @review = Whatser::Review.new(:poi_id => @poi_id, :body => 'four stars')
  end
  
  def test_list
    assert @client.reviews.list(@poi_id, :page => 1).is_a?(Whatser::Response)
  end
  
  def test_create
    assert @client.reviews.create(@poi_id, :body => 'four stars').is_a?(Whatser::Response)
  end
  
  def test_delete
    assert @client.reviews.delete(@poi_id, :body => 'four stars').is_a?(Whatser::Response)
  end  
  
  def test_save
    assert @review.save.is_a?(Whatser::Response)
  end
  
  def test_update
    @review.id = 1
    assert @review.save.is_a?(Whatser::Response)
  end  
    
  def test_to_params
    params = [:body]
    params.each do |p|
      assert @review.to_params.keys.include?(p)
    end
  end  
end