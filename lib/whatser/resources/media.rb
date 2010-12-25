module Whatser
  class Media < Whatser::Resource
    attr_accessor :id,:user_id,:poi_id
    attr_accessor :name,:thumb_pic,:small_pic,:mid_pic,:url,:mime,:created_at
    attr_writer   :resource,:remote_resource
    
    class << self
      def list(poi_id, opts={})
        api_request :get, "/api/poi/#{poi_id}/media", {:query => opts}
      end
              
      def find(poi_id, id, opts={})
        api_request :get, "/api/poi/#{poi_id}/media/#{id}", {:query => opts}
      end
      
      def create(poi_id, params={})
        api_request :post, "/api/poi/#{poi_id}/media", {:body => {'media' => params} }
      end  
      
      def delete(poi_id, id)
        api_request :delete, "/api/poi/#{poi_id}/media/#{id}"
      end              
    end
    
    def save
      if id.blank?
        Whatser::Media.create(poi_id, to_params)
      else
        api_request :put, "/api/poi/#{poi_id}/media/#{id}", {:body => {'media' => to_params} }
      end
    end           
    
    def delete
      Whatser::Media.delete(poi_id, id)
    end       
    
    def to_params
      {:name=>name,:resource=>@resource,:remote_resource=>@remote_resource}
    end      
  end
end