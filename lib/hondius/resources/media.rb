module SoGeo
  module Hondius
    class Media < SoGeo::Hondius::Resource
      attr_accessor :id,:user_id,:poi_id
      attr_accessor :name,:thumb_pic,:small_pic,:mid_pic,:url,:mime,:created_at
      attr_writer   :resource,:remote_resource
      
      class << self
        def list(poi_id, opts={})
          api_request :get, "/poi/#{poi_id}/media", {:query => opts}
        end
                
        def find(poi_id, id, opts={})
          api_request :get, "/poi/#{poi_id}/media/#{id}", {:query => opts}
        end
        
        def create(poi_id, opts={})
          api_request :post, "/poi/#{poi_id}/media", {:body => {'media' => to_params} }
        end        
      end
      
      def save
        if id.blank?
          api_request :post, "/poi/#{poi_id}/media", {:body => {'media' => to_params} }
        else
          api_request :put, "/poi/#{poi_id}/media/#{id}", {:body => {'media' => to_params} }
        end
      end           
      
      def delete
        api_request :delete, "/poi/#{poi_id}/media/#{id}"
      end       
      
      def to_params
        {:name=>name,:resource=>@resource,:remote_resource=>@remote_resource}
      end      
    end
  end
end