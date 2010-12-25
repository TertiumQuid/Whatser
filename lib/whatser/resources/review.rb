module Whatser
  class Review < Whatser::Resource
    attr_accessor :id,:user_id,:poi_id
    attr_accessor :body,:created_at
    
    class << self
      def list(poi_id, opts={})
        api_request :get, "/api/poi/#{poi_id}/reviews", {:query => opts}
      end
              
      def find(poi_id, id, opts={})
        api_request :get, "/api/poi/#{poi_id}/reviews/#{id}", {:query => opts}
      end
      
      def create(poi_id, params={})
        api_request :post, "/api/poi/#{poi_id}/reviews", {:body => {'review' => params} }
      end
      
      def delete(poi_id, id)
        api_request :delete, "/api/poi/#{poi_id}/reviews/#{id}"
      end               
    end      
    
    def save
      if id.blank?
        Whatser::Review.create(poi_id, to_params)
      else
        api_request :put, "/api/poi/#{poi_id}/reviews/#{id}", {:body => {'review' => to_params} }
      end
    end           
    
    def delete
      Whatser::Review.delete(poi_id, id)
    end       
    
    def to_params
      {:body => body}
    end      
  end
end