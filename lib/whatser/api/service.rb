require 'cgi'

module Whatser
  class Service < Whatser::Resource
    class << self
      def key
        self.name.split('::').last.downcase
      end
          
      def connection_url(params={})
        "#{client.api_uri}/oauth/services/#{key}/authorize?#{connection_querystring(params)}"
      end  
      
      def disconnection_url(params={})
        "#{client.api_uri}/oauth/services/#{key}/disconnect"
      end
      
      def connection_querystring(params={})
        auth_params( params ).map{|k,v| "#{CGI.escape( (k || '').to_s )}=#{CGI.escape( (v || '').to_s )}"}.join('&')
      end

      def auth_params(params={})
        { 
          :client_id => client.api_key, 
          :redirect_uri => client.redirect_uri
        }.merge( params )
      end
    end
    
    def key; self.class.key; end
    
    def connection_url(params={}); self.class.connection_url(params) end
    def disconnection_url(params={}); self.class.disconnection_url(params) end
  end
end