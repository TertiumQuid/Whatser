require 'oauth2'

module Whatser
  module OAuth
    def oauth_client
      OAuth2::Client.new(api_key, api_secret, :site => api_uri)
    end
    
    def get_oauth_token(code, params={})
      oauth_client.web_server.get_access_token( code, params)
    end
    
    def oauth_authorize_url(params={})
      oauth_client.web_server.authorize_url(params)
    end
    
    def login(email, password)
      request( :get, '/oauth/access_token', {:query => password_grant_params(email, password)}, :auth => :key, :keys => auth_keys )
    end
    
  private

    def auth_keys
      ['access_token','refresh_token','expires_in']
    end

    def hash_to_query(hash)
      hash.collect do |key, value|
        "#{key}=#{value}"
      end * '&'
    end
    
    def password_grant_params(email, password)
      {'grant_type' => 'password', 
       'client_id' => api_key,
       'client_secret' => api_secret,
       'username' => email,
       'password' => password}
    end
  end  
end