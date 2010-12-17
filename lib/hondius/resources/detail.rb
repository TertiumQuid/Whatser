module SoGeo
  module Hondius
    class Detail < SoGeo::Hondius::Resource
      attr_accessor :id,:user_id,:poi_id
      attr_accessor :data,:created_at
      
      class << self
        def list(poi_id, opts={})
          api_request :get, "/poi/#{poi_id}/details", {:query => opts}
        end
                
        def find(poi_id, id, opts={})
          api_request :get, "/poi/#{poi_id}/details/#{id}", {:query => opts}
        end
        
        def create(poi_id, opts={})
          api_request :post, "/poi/#{poi_id}/details", {:body => {'detail' => to_params} }
        end        
      end      
      
      def save
        if id.blank?
          api_request :post, "/poi/#{poi_id}/details", {:body => {'detail' => to_params} }
        else
          api_request :put, "/poi/#{poi_id}/details/#{id}", {:body => {'detail' => to_params} }
        end
      end           
      
      def delete
        api_request :delete, "/poi/#{poi_id}/details/#{id}"
      end       
      
      def to_params
        {:data => data}
      end
    end
  end
end