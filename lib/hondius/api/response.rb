require 'json'

module Whatser
  class Response
    include Enumerable
    
    attr_accessor :data,:http_status,:version,:scope
    attr_accessor :page,:per_page,:more
    attr_accessor :error,:error_description,:error_uri
    
    attr_accessor :expires_in,:refresh_token,:access_token      
    
    API_RESPONSE_KEYS = ['data','http_status','version','scope','page','per_page','more','error','error_description','error_uri']
    
    def initialize(json_or_hash, opts={})
      return if json_or_hash.blank?
      
      begin
        hash = json_or_hash.is_a?(String) ? JSON.parse(json_or_hash) : json_or_hash
      rescue JSON::ParserError
        hash = {}
      end
      
      load_from_hash(hash, opts[:keys])
      ensure_status_code( opts[:code] )
    end
    
    def ensure_status_code(code)
      self.http_status ||= code
    end
    
    def load_from_hash(hash,keys=nil)
      return unless hash.is_a?(Hash)
      keys ||= API_RESPONSE_KEYS
      keys.each do |a|
        send("#{a}=", hash[a]) if hash.has_key?(a)
      end
    end
    
    def data_enum
      data.blank? ? [] : (data.is_a?(Array) ? data : [data])
    end
    
    def each(&block)
      data_enum.each(&block)
    end
    
    def succeeded?
      http_status == 200
    end
    
    def unauthorized?
      http_status == 401
    end
    
    def forbidden?
      http_status == 403
    end      
    
    def not_found?
      http_status == 404
    end
    
    def not_allowed?
      http_status == 405
    end
    
    def not_acceptable?
      http_status == 406
    end      
    
    def confict?
      http_status == 409
    end
    
    def unprocessable_entity?
      http_status == 422
    end
    
    def server_error?
      http_status == 500
    end      
  end
end