require 'helper'

class TestResponse < Test::Unit::TestCase
  def test_initialize
    res = SoGeo::Hondius::Response.new({})
    assert_equal nil, res.data
    res = SoGeo::Hondius::Response.new( {'data' => []} )
    assert_equal [], res.data
  end
  
  def test_load_from_hash
    params = {'data'=>'test1','http_status'=>'test2','version'=>'test3','scope'=>'test4','page'=>'test5','per_page'=>'test6','more'=>'test7','error'=>'test8','error_description'=>'test9','error_uri'=>'test0'}
    res = SoGeo::Hondius::Response.new({})
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
end