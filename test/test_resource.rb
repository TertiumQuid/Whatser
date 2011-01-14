require 'helper'

class TestResource < Test::Unit::TestCase
  def test_client
    client = Whatser::Client.new
    Whatser::Resource.instance_variable_set('@client',client)
    assert_equal client, Whatser::Resource.client
  end
  
  def test_set_client
    client = Whatser::Client.new
    res = Whatser::Resource.set(client)
    assert_equal res.client, client
  end
  
  def test_convert_data_to_model_with_blank
    res = Whatser::Resource
    assert_nil res.convert_data_to_model(nil)
    assert_equal [], res.convert_data_to_model([])
  end
  
  def test_convert_data_to_model_with_hash
    res = Whatser::Resource
    mod = res.convert_data_to_model(:test => '1', :testing => '1')
    assert mod.is_a?(Whatser::Resource)
  end
  
  def test_convert_data_to_model_with_array
    res = Whatser::Resource
    arr = res.convert_data_to_model([{:test => '1', :testing => '1'},{:test => '2', :testing => '1'}])
    arr.each do |mod|
      assert mod.is_a?(Whatser::Resource)
    end
  end  
  
  def test_api_request
    Whatser::Resource.set( Whatser.client )
    resource = Whatser::Resource
    response = resource.api_request(:get, '/path', {})
    assert response.is_a?(Whatser::Response)
  end
  
  def test_instance_api_request
    Whatser::Resource.set( Whatser.client )
    resource = Whatser::Resource.new
    response = resource.api_request(:get, '/path', {})
    assert response.is_a?(Whatser::Response)
  end
  
  def test_from_hash_to_model
    hash = {:test => '1', :testing => '1'}
    mod = Whatser::Resource.from_hash_to_model(hash)
    assert mod.is_a?(Whatser::Resource)
  end
  
  def test_from_hash_to_model_with_root
    hash = {:root => {:test => '1', :testing => '1'}}
    mod = Whatser::Resource.from_hash_to_model(hash)
    assert mod.is_a?(Whatser::Resource)
  end  
  
  def test_from_hash_to_model_with_option
    hash = {:id => '1', :name => 'Test'}
    option = Whatser::Poi
    mod = Whatser::Resource.from_hash_to_model(hash, option)
    assert mod.is_a?(Whatser::Poi)
  end  
  
  def test_from_hash_to_model_with_string
    mod = Whatser::Resource.from_hash_to_model('freetextstringtest')
    assert mod.is_a?(Whatser::Resource)
  end
  
  def test_from_hash_to_model_empty
    mod = Whatser::Resource.from_hash_to_model(nil)
    assert mod.is_a?(Whatser::Resource)
  end  
end