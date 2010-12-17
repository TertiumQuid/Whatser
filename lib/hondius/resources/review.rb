module SoGeo
  module Hondius
    class Review < SoGeo::Hondius::Resource
      attr_accessor :id,:user_id,:poi_id
      attr_accessor :body,:created_at
      
      class << self
        def list(poi_id, opts={})
          api_request :get, "/poi/#{poi_id}/reviews", {:query => opts}
        end
                
        def find(poi_id, id, opts={})
          api_request :get, "/poi/#{poi_id}/reviews/#{id}", {:query => opts}
        end
        
        def create(poi_id, opts={})
          api_request :post, "/poi/#{poi_id}/reviews", {:body => {'review' => to_params} }
        end        
      end      
      
      def save
        if id.blank?
          api_request :post, "/poi/#{poi_id}/reviews", {:body => {'review' => to_params} }
        else
          api_request :put, "/poi/#{poi_id}/reviews/#{id}", {:body => {'review' => to_params} }
        end
      end           
      
      def delete
        api_request :delete, "/poi/#{poi_id}/reviews/#{id}"
      end       
      
      def to_params
        {:body => body}
      end      
    end
  end
end