module Whatser
  class Service < Whatser::Resource
    def key
      self.class.name.split('::').last.downcase
    end
    
    def connection_url
      "#{client.api_uri}/oauth/services/#{key}/authorize"
    end
    
    def disconnection_url
      "#{client.api_uri}/oauth/services/#{key}/disconnect"
    end      
  end
end