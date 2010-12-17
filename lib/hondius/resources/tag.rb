module SoGeo
  module Hondius
    class Tag < SoGeo::Hondius::Resource
      attr_accessor :id,:poi_id
      attr_accessor :name
      
      class << self
        def list(poi_id, opts={})
          api_request :get, "/poi/#{poi_id}/tags", {:query => opts}
        end
        
        def create(poi_id, opts={})
          api_request :post, "/poi/#{poi_id}/tags", {:body => {'tagging' => to_params} }
        end        
      end
      
      def save
        if id.blank?
          api_request :post, "/poi/#{poi_id}/tags", {:body => {'tagging' => to_params} }
        else
          api_request :put, "/poi/#{poi_id}/tags/#{id}", {:body => {'tagging' => to_params} }
        end
      end
      
      def delete
        api_request :delete, "/poi/#{poi_id}/tags/#{id}"
      end       
      
      def to_params
        {:name => name}
      end      
    end
  end
end