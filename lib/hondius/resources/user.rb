module SoGeo
  module Hondius
    class User < SoGeo::Hondius::Resource
      attr_accessor :id,:facebook_id,:gowalla_id,:foursquare_id,:twitter_id
      attr_accessor :name,:twitter_name,:avatar_pic,:location,:bio,:email
      attr_accessor :last_login_at,:promoted,:premium,:collections_count
      attr_writer   :avatar,:remote_avatar,:password,:lat,:lng
      
      class << self
        def me
          api_request :get, "/users/me"
        end
        
        def search(opts={})
          api_request :get, "/users/lookup", {:query => opts}
        end        
        
        def find(id, opts={})
          api_request :get, "/users/#{id}/profile", {:query => opts}
        end
        
        def create(opts={})
          api_request :post, "/users", {:query => {'user' => opts} }, :auth => :key
        end        
      end      

      def save
        if id.blank?
          api_request :post, "/users", {:body => {'user' => to_params} }, :auth => :key
        else
          api_request :put, "/users/me", {:body => {'user' => to_params} }
        end
      end
            
      def to_params
        {:name=>name,:avatar_pic=>@remote_avatar,:location=>location,:bio=>bio,:email=>email,:password=>password,:lat=>lat,:lng=>lng}
      end      
    end
       
  end
end