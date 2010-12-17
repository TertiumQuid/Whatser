require 'helper'

class TestResource < Test::Unit::TestCase
  def test_client
    client = SoGeo::Hondius::Client.new
    SoGeo::Hondius::Resource.instance_variable_set('@client',client)
    assert_equal client, SoGeo::Hondius::Resource.client
  end
  
  def test_set_client
    client = SoGeo::Hondius::Client.new
    res = SoGeo::Hondius::Resource.set(client)
    assert_equal res.client, client
  end
  
  def test_convert_data_to_model_with_blank
    res = SoGeo::Hondius::Resource
    assert_nil res.convert_data_to_model(nil)
    assert_equal [], res.convert_data_to_model([])
  end
  
  def test_convert_data_to_model_with_hash
    res = SoGeo::Hondius::Resource
    mod = res.convert_data_to_model(:test => '1', :testing => '1')
    assert mod.is_a?(SoGeo::Hondius::Resource)
  end
  
  def test_convert_data_to_model_with_array
    res = SoGeo::Hondius::Resource
    arr = res.convert_data_to_model([{:test => '1', :testing => '1'},{:test => '2', :testing => '1'}])
    arr.each do |mod|
      assert mod.is_a?(SoGeo::Hondius::Resource)
    end
  end  
  
  def test_api_request
    SoGeo::Hondius::Resource.set( SoGeo::Hondius.client )
    resource = SoGeo::Hondius::Resource
    response = resource.api_request(:get, '/path', {})
    assert response.is_a?(SoGeo::Hondius::Response)
  end
  
  def test_instance_api_request
    SoGeo::Hondius::Resource.set( SoGeo::Hondius.client )
    resource = SoGeo::Hondius::Resource.new
    response = resource.api_request(:get, '/path', {})
    assert response.is_a?(SoGeo::Hondius::Response)
  end
end