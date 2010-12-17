require 'oauth2'

module SoGeo
  module Hondius
    module OAuth
      def oauth_client
        OAuth2::Client.new(api_key, api_secret, :site => api_uri)
      end
      
      def get_oauth_token(access_token, params={})
        oauth_client.web_server.get_access_token( access_token, params)
      end
      
      def oauth_authorize_url(params={})
        oauth_client.web_server.authorize_url(params)
      end
      
      def login(email, password)
        request :get, 'oauth/access_token', {:query => {:username => email, :password => password}}, :auth => :key
      end
      
    private      

      def hash_to_query(hash)
        hash.collect do |key, value|
          "#{key}=#{value}"
        end * '&'
      end
    end
  end    
end