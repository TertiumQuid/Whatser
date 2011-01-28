module Whatser
  class ActivityFeed < Whatser::Resource
    attr_accessor :user_id,:user_name,:user_avatar,:poi_id,:poi_name,:object_id,:object_name,:object_avatar
    attr_accessor :city,:message,:created_at
    
    class << self
      def mine(params={})
        user('me', params)
      end
      
      def global(params={})
        api_request :get, "/api/users/activity_feed", {:query => params}
      end      
      
      def user(user_id, params={})
        api_request :get, "/api/users/#{user_id}/activity_feed", {:query => params}
      end   
      
      def spot(poi_id, params={})
        api_request :get, "/api/poi/#{poi_id}/activity_feed", {:query => params}
      end           
    end    
  end
end