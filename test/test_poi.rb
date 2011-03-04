require 'helper'

class TestPoi < Test::Unit::TestCase
  def setup
    @client = Whatser::Client.new
    @poi = Whatser::Poi.set(@client).new
  end
  
  def test_to_params
    poi = Whatser::Poi.new
    params = [:name,:lat,:lng,:street,:district,:region,:city,:postal_code,:country]
    params.each do |p|
      assert poi.to_params.keys.include?(p)
    end
  end
  
  def test_suggested
    assert @client.spots.suggested(:opt => 'test').is_a?(Whatser::Response)
  end
  
  def test_search
    assert @client.spots.search(:opt => 'test').is_a?(Whatser::Response)
  end
  
  def test_find
    assert @client.spots.find(1, :opt => 'test').is_a?(Whatser::Response)
  end
  
  def test_create
    assert @client.spots.create(:name => 'test', :lat => 45, :lng => 45).is_a?(Whatser::Response)
  end
  
  def test_delete
    assert @client.spots.delete(1).is_a?(Whatser::Response)
  end  
  
  def test_save
    assert @poi.save.is_a?(Whatser::Response)
  end
  
  def test_save_and_update
    @poi.id = 1
    assert @poi.save.is_a?(Whatser::Response)
  end
  
  def test_from_hash_to_model
    hash = {'id' => 1, 'name' => 'test', 'lat' => 1, 'lng' => 1, 'street' => 'test', 
            'district' => 'test', 'region' => 'test', 'city' => 'test', 'postal_code' => '1', 'country' => 'test'}
    poi = Whatser::Poi.from_hash_to_model(hash)
    assert poi.is_a?(Whatser::Poi)
    
    assert_equal hash['id'], poi.id
    assert_equal hash['name'], poi.name
    assert_equal hash['lat'], poi.lat
    assert_equal hash['lng'], poi.lng
    assert_equal hash['street'], poi.street
    assert_equal hash['district'], poi.district
    assert_equal hash['region'], poi.region
    assert_equal hash['city'], poi.city
    assert_equal hash['postal_code'], poi.postal_code
    assert_equal hash['country'], poi.country
  end
  
  def test_foursquare_connected
    assert_equal false, @poi.foursquare_connected?
    @poi.foursquare_id = 1
    assert_equal true, @poi.foursquare_connected?
  end
  
  def test_gowalla_connected
    assert_equal false, @poi.foursquare_connected?
    @poi.foursquare_id = 1
    assert_equal true, @poi.foursquare_connected?
  end  
  
  def test_activity
    assert @poi.activity(:opt => 'test').is_a?(Whatser::Response)
  end
  
  def test_comments
    assert @poi.comments(:opt => 'test').is_a?(Whatser::Response)
  end   
  
  def branded_tags
    @poi.branded_tags = nil
    assert_nil @poi.branded_tags
    
    @poi.branded_tags = {}
    assert_nil @poi.branded_tags
    
    @poi.branded_tags = []
    assert_equal [], @poi.branded_tags
    
    tag = Whatser::Tag.new(:name => 'test')
    tags = [tag]
    @poi.branded_tags = tags
    assert_equal [tag], @poi.branded_tags
    
    tags = [{"name"=>"hash","web_detail_pic_url"=>nil,"touch_detail_pic_url"=>nil,"touch_list_pic_url"=>nil,"web_list_pic_url"=>nil,"wap_detail_pic_url"=>nil,"wap_list_pic_url"=>nil}]
    @poi.branded_tags = tags
    assert_equal "hash", @poi.branded_tags.first.name
  end
end