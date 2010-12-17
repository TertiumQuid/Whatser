require 'rubygems'
require 'httparty'

require File.expand_path('../hondius/net/http', __FILE__)
require File.expand_path('../hondius/net/oauth', __FILE__)
require File.expand_path('../hondius/configuration', __FILE__)
require File.expand_path('../hondius/client', __FILE__)
require File.expand_path('../hondius/errors', __FILE__)
require File.expand_path('../hondius/api/response', __FILE__)

require File.expand_path('../hondius/resources/resource', __FILE__)
require File.expand_path('../hondius/resources/check_in', __FILE__)
require File.expand_path('../hondius/resources/collection', __FILE__)
require File.expand_path('../hondius/resources/data_source', __FILE__)
require File.expand_path('../hondius/resources/detail', __FILE__)
require File.expand_path('../hondius/resources/media', __FILE__)
require File.expand_path('../hondius/resources/poi', __FILE__)
require File.expand_path('../hondius/resources/review', __FILE__)
require File.expand_path('../hondius/resources/subscription', __FILE__)
require File.expand_path('../hondius/resources/tag', __FILE__)
require File.expand_path('../hondius/resources/user', __FILE__)

module SoGeo
  module Hondius
    class << self  
      def client(options={})
        @client ||= SoGeo::Hondius::Client.new(options)
      end
    end   
  end
end