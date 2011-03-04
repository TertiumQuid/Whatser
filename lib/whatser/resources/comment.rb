module Whatser
  class Comment < Whatser::Resource
    attr_accessor :id,:user_id,:activity_feed_id,:subject_id,:poi_id,:created_at
    attr_accessor :user_name,:user_avatar,:subject_type,:subject_name,:body
    
    class << self
      def poi(poi_id, opts={})
        api_request :get, "/api/poi/#{poi_id}/comments", {:query => opts}
      end

      def media(media_id, opts={})
        api_request :get, "/api/media/#{media_id}/comments", {:query => opts}
      end
      
      def delete(id)
        api_request :delete, "/api/comments/#{id}"
      end
      
      def create(resource_name, resource_id, body)
        api_request :post, "/api/#{resource_name}/#{resource_id}/tags", {:body => {'comment' => {'body' => body}} }
      end      
    end
    
    def poi
      Whatser::Poi.set(self.class.client).find(poi_id) if poi_id
    end

    def user
      Whatser::User.set(self.class.client).find(user_id) if user_id
    end
    
    def delete
      self.class.delete(id)
    end     
  end
end