require 'json'

module SoGeo
  module Hondius
    class Response
      attr_accessor :data,:http_status,:version,:scope
      attr_accessor :page,:per_page,:more
      attr_accessor :error,:error_description,:error_uri
      
      API_RESPONSE_KEYS = ['data','http_status','version','scope','page','per_page','more','error','error_description','error_uri']
      
      def initialize(json_or_hash)
        return if json_or_hash.blank?
        
        hash = json_or_hash.is_a?(String) ? JSON.parse(json_or_hash) : json_or_hash
        load_from_hash(hash)
      end
      
      def load_from_hash(hash)
        return unless hash.is_a?(Hash)
        API_RESPONSE_KEYS.each do |a|
          send("#{a}=", hash[a]) if hash.has_key?(a)
        end
      end
    end
  end
end