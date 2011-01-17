module Whatser
  class Service < Whatser::Resource
    class << self
      def connection_url
        "#{client.api_uri}/oauth/services/#{key}/authorize"
      end      
      
      def key
        self.name.split('::').last.downcase
      end
    end
    
    def key; self.class.key; end
    
    def connection_url
      "#{client.api_uri}/oauth/services/#{key}/authorize"
    end
    
    def disconnection_url
      "#{client.api_uri}/oauth/services/#{key}/disconnect"
    end      
  end
end