require 'helper'

class TestTag < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @poi_id = 1
    @tag = Whatser::Tag.new(:poi_id => @poi_id, :name => 'my tag')
  end
  
  def test_list
    assert @client.tags.list(@poi_id, :page => 1).is_a?(Whatser::Response)
  end
  
  def test_create
    assert @client.tags.create(@poi_id, 'my tag').is_a?(Whatser::Response)
  end
  
  def test_delete
    assert @client.tags.delete(@poi_id, 'my tag').is_a?(Whatser::Response)
  end  
  
  def test_save
    assert @tag.save.is_a?(Whatser::Response)
  end
    
  def test_to_params
    params = [:name]
    params.each do |p|
      assert @tag.to_params.keys.include?(p)
    end
  end  
end