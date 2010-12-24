require 'helper'

class TestCollection < Test::Unit::TestCase
  def test_initialize
    data = [1,2,3]
    collection = Whatser::Collection.new(data)
    assert_equal data, collection.data
  end
end