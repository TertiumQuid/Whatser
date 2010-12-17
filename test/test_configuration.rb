require 'helper'

class TestConfiguration < Test::Unit::TestCase
  def test_valid_options_keys
    expected = [:api_key,:api_secret,:username,:password,:oauth_token,:api_uri]
    assert_equal expected, SoGeo::Hondius::Configuration::VALID_OPTIONS_KEYS
  end
end