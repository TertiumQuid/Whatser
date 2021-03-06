module Whatser
  class User < Whatser::Resource
    attr_accessor :id,:facebook_id,:gowalla_id,:foursquare_id,:twitter_id
    attr_accessor :name,:twitter_name,:avatar_pic,:location,:bio,:email
    attr_accessor :last_login_at,:promoted
    attr_writer   :avatar,:remote_avatar,:password,:lat,:lng
    attr_writer   :comments_count,:poi_count,:check_ins_count,:media_count,:taggings_count,:follows_count,:followers_count,:collections_count
    attr_writer   :access_token
    
    class << self
      def me
        api_request :get, "/api/users/me"
      end
      
      def anonymous
        api_request :get, "/api/users/anonymous"
      end
      
      def search(params={})
        api_request :get, "/api/users/lookup", {:query => params}
      end        
      
      def suggested(params={})
        api_request :get, "/api/users/suggested", {:query => params}
      end        
      
      def find(id, params={})
        api_request :get, "/api/users/#{id}/profile", {:query => params}
      end
              
      def create(params={})
        api_request :post, "/api/users", {:body => {'user' => params} }, :auth => :key
      end

      def invite(emails)
        api_request :post, "/api/invites", {:query => {'emails' => emails} }
      end
      
      def visitors(id, params={})
        api_request :get, "/api/poi/#{id}/visitors", {:query => params}
      end      

      def collectors(id, params={})
        api_request :get, "/api/poi/#{id}/collectors", {:query => params}
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
      Whatser::Follow.set(self.class.client).connection(id)
    end 
    
    def followers(params={})
      Whatser::Follow.set(self.class.client).followers(id, params)
    end    
    
    def thanks(poi_id,params={})
      api_request :post, "/api/users/#{id}/poi/#{poi_id}/thanks", {:query => params}
    end
    
    def oauth_token
      access_token
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
      {:name=>name,:avatar_pic=>@remote_avatar,:location=>location,:bio=>bio,:email=>email}
    end      
  end
end