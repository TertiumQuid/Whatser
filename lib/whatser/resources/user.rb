module Whatser
  class User < Whatser::Resource
    attr_accessor :id,:facebook_id,:gowalla_id,:foursquare_id,:twitter_id
    attr_accessor :name,:twitter_name,:avatar_pic,:location,:bio,:email
    attr_accessor :last_login_at,:promoted,:premium,:collections_count
    attr_writer   :avatar,:remote_avatar,:password,:lat,:lng
    attr_writer   :access_tokens
    
    class << self
      def me
        api_request :get, "/api/users/me"
      end
      
      def anonymous(opts={})
        api_request :get, "/api/users/anonymous", {:query => opts}
      end
      
      def search(opts={})
        api_request :get, "/api/users/lookup", {:query => opts}
      end        
      
      def search(opts={})
        api_request :get, "/api/users/suggested", {:query => opts}
      end        
      
      def find(id, opts={})
        api_request :get, "/api/users/#{id}/profile", {:query => opts}
      end
      
      def invite(emails, opts={})
        api_request :post, "/api/invites", {:query => emails}
      end
              
      def create(params={})
        api_request :post, "/api/users", {:body => {'user' => params} }, :auth => :key
      end        
    end      

    def save
      if id.blank?
        api_request :post, "/api/users", {:body => {'user' => to_params} }, :auth => :key
      else
        api_request :put, "/api/users/me", {:body => {'user' => to_params} }
      end
    end
          
    def connection
      Whatser::Follow.connection(id)
    end 
    
    def facebook_connected?
      !facebook_id.blank?
    end
    
    def foursquare_connected?
      !foursquare_id.blank?
    end
    
    def gowalla_connected?
      !gowalla_id.blank?
    end
    
    def twitter_connected?
      !twitter_id.blank?
    end                             
          
    def to_params
      {:name=>name,:avatar_pic=>@remote_avatar,:location=>location,:bio=>bio,:email=>email,:password=>password,:lat=>lat,:lng=>lng}
    end      
  end
end