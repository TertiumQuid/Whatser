require 'helper'

class TestResponse < Test::Unit::TestCase
  def test_initialize
    res = Whatser::Response.new({})
    assert_equal nil, res.data
    res = Whatser::Response.new( {'data' => []} )
    assert_equal [], res.data
  end
  
  def test_load_from_hash
    params = {'data'=>'test1','http_status'=>'test2','version'=>'test3','scope'=>'test4','page'=>'test5','per_page'=>'test6','more'=>'test7','error'=>'test8','error_description'=>'test9','error_uri'=>'test0'}
    res = Whatser::Response.new({})
    res.load_from_hash(params)
    assert_equal params['data'], res.data
    assert_equal params['http_status'], res.http_status
    assert_equal params['version'], res.version
    assert_equal params['scope'], res.scope
    assert_equal params['page'], res.page
    assert_equal params['per_page'], res.per_page
    assert_equal params['more'], res.more
    assert_equal params['error'], res.error
    assert_equal params['error_description'], res.error_description
    assert_equal params['error_uri'], res.error_uri
  end
  
  def test_data_enum
    res = Whatser::Response.new({})
    assert_equal [], res.data_enum
    res.data = "test"
    assert_equal ["test"], res.data_enum
    res.data = [1,2,3]
    assert_equal [1,2,3], res.data_enum
  end
  
  def test_each
    res = Whatser::Response.new({})
    res.data = [1,2,3]
    assert res.respond_to?(:each)
    res.each_with_index do |e,idx|
      assert_equal res.data[idx], e
    end
  end
end