require 'helper'

class TestCollection < Test::Unit::TestCase
  def setup
    @data = [1,2,3]
  end
  
  def test_initialize
    collection = Whatser::Collection.new(@data)
    assert_equal @data, collection.data
  end
  
  def test_each_enumerable
    iterated = []
    collection = Whatser::Collection.new(@data)
    collection.each do |c|
      iterated << c
    end
    assert_equal @data, iterated
  end
  
  def test_size
    collection = Whatser::Collection.new
    assert_equal 0, collection.size
    collection.data = @data
    assert_equal @data.size, collection.size
  end
end