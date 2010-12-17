require 'helper'

class TestPoi < Test::Unit::TestCase
  def test_to_params
    poi = SoGeo::Hondius::Poi.new
    params = [:name,:lat,:lng,:street,:district,:region,:city,:postal_code,:country]
    params.each do |p|
      assert poi.to_params.keys.include?(p)
    end
  end
  
  def test_suggested
    client = SoGeo::Hondius::Client.new
    assert client.spots.suggested(:opt => 'test').is_a?(SoGeo::Hondius::Response)
  end
  
  def test_from_hash_to_model
    hash = {'id' => 1, 'name' => 'test', 'lat' => 1, 'lng' => 1, 'street' => 'test', 
            'district' => 'test', 'region' => 'test', 'city' => 'test', 'postal_code' => '1', 'country' => 'test'}
    poi = SoGeo::Hondius::Poi.from_hash_to_model(hash)
    assert poi.is_a?(SoGeo::Hondius::Poi)
    
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
end