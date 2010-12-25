module Whatser
  class Tag < Whatser::Resource
    attr_accessor :id,:poi_id
    attr_accessor :name
    
    class << self
      def list(poi_id, opts={})
        api_request :get, "/api/poi/#{poi_id}/tags", {:query => opts}
      end
      
      def create(poi_id, tag_name)
        api_request :post, "/api/poi/#{poi_id}/tags", {:body => {'tagging' => {'name' => tag_name}} }
      end
      
      def delete(poi_id, tag_name)
        api_request :delete, "/api/poi/#{poi_id}/tags/#{tag_name}"
      end        
    end
    
    def save
      self.class.create(poi_id, name)
    end
    
    def delete
      self.class.delete(poi_id, name)
    end
    
    def to_params
      {:name => name}
    end      
  end
end