module Whatser
  class Detail < Whatser::Resource
    attr_accessor :id,:user_id,:poi_id
    attr_accessor :data,:created_at
    
    class << self
      def list(poi_id, opts={})
        api_request :get, "/api/poi/#{poi_id}/details", {:query => opts}
      end
              
      def find(poi_id, id, opts={})
        api_request :get, "/api/poi/#{poi_id}/details/#{id}", {:query => opts}
      end
      
      def create(poi_id, params={})
        api_request :post, "/api/poi/#{poi_id}/details", {:body => {'detail' => params} }
      end  
      
      def delete(poi_id, id)
        api_request :delete, "/api/poi/#{poi_id}/details/#{id}"
      end              
    end      
    
    def save
      if id.blank?
        Whatser::Detail.create(poi_id, to_params)
      else
        api_request :put, "/api/poi/#{poi_id}/details/#{id}", {:body => {'detail' => to_params} }
      end
    end           
    
    def delete
      Whatser::Detail.delete(poi_id, id)
    end       
    
    def to_params
      {:data => data}
    end
  end
end