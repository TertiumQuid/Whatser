require 'rubygems'
require 'httparty'

require File.expand_path('../whatser/net/http', __FILE__)
require File.expand_path('../whatser/net/oauth', __FILE__)
require File.expand_path('../whatser/configuration', __FILE__)
require File.expand_path('../whatser/client', __FILE__)
require File.expand_path('../whatser/errors', __FILE__)
require File.expand_path('../whatser/api/response', __FILE__)

require File.expand_path('../whatser/resources/resource', __FILE__)
require File.expand_path('../whatser/resources/city', __FILE__)
require File.expand_path('../whatser/resources/check_in', __FILE__)
require File.expand_path('../whatser/resources/collection', __FILE__)
require File.expand_path('../whatser/resources/media', __FILE__)
require File.expand_path('../whatser/resources/poi', __FILE__)
require File.expand_path('../whatser/resources/subscription', __FILE__)
require File.expand_path('../whatser/resources/tag', __FILE__)
require File.expand_path('../whatser/resources/user', __FILE__)
require File.expand_path('../whatser/resources/follow', __FILE__)
require File.expand_path('../whatser/resources/comment', __FILE__)
require File.expand_path('../whatser/resources/activity_feed', __FILE__)

require File.expand_path('../whatser/api/service', __FILE__)
require File.expand_path('../whatser/api/facebook', __FILE__)
require File.expand_path('../whatser/api/foursquare', __FILE__)
require File.expand_path('../whatser/api/twitter', __FILE__)
require File.expand_path('../whatser/api/gowalla', __FILE__)

module Whatser
  class << self  
    def client(options={})
      @client ||= Whatser::Client.new(options)
    end
  end   
end