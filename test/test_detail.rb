require 'helper'

class TestDetail < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @poi_id = 1
    @params = {:rating => 'four stars', :hours => '9-5'}
    @detail = Whatser::Detail.new(:poi_id => @poi_id, :data => @params)
  end
  
  def test_list
    assert @client.reviews.list(@poi_id, :page => 1).is_a?(Whatser::Response)
  end
  
  def test_create
    assert @client.reviews.create(@poi_id, :data => @params).is_a?(Whatser::Response)
  end
  
  def test_delete
    assert @client.reviews.delete(@poi_id, :data => @params).is_a?(Whatser::Response)
  end  
  
  def test_save
    assert @detail.save.is_a?(Whatser::Response)
  end
  
  def test_update
    @detail.id = 1
    assert @detail.save.is_a?(Whatser::Response)
  end  
    
  def test_to_params
    params = [:data]
    params.each do |p|
      assert @detail.to_params.keys.include?(p)
    end
  end  
end