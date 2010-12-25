require 'helper'

class TestPoi < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @poi_id = 1
    @check_in = Whatser::CheckIn.new(:poi_id => @poi_id)
  end
  
  def test_list
    assert @client.check_ins.list(:page => @poi_id).is_a?(Whatser::Response)
  end
  
  def test_create
    assert @client.check_ins.create(@poi_id, :check_in_at => Time.now).is_a?(Whatser::Response)
  end  
  
  def test_save
    assert @check_in.save.is_a?(Whatser::Response)
  end
    
  def test_to_params
    params = [:locate,:lat,:lng,:gowalla,:foursquare,:check_in_at,:check_out_at]
    params.each do |p|
      assert @check_in.to_params.keys.include?(p)
    end
  end  
end