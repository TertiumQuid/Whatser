module Whatser
  class Collection < Whatser::Resource
    include Enumerable
    
    attr_accessor :data,:city,:city_name
    
    class << self
      def mine(opts={})
        collect_api_request :get, "/api/users/me/black/book", {:query => opts}
      end
      
      def list(user_id, opts={})
        collect_api_request :get, "/api/users/#{user_id}/black/book", {:query => opts}
      end   
      
      def add(poi_id, opts={})
        api_request :post, "/api/poi/#{poi_id}/black/book", {:body => ''}, :model => Whatser::Poi
      end
      
      def delete(poi_id)
        api_request :delete, "/api/poi/#{poi_id}/black/book", {:body => ''}, :model => Whatser::Poi
      end   
      
    private

      def collect_api_request(verb, path, opts={})
        res = api_request(verb, path, opts, :model => Whatser::Poi)
        collection = Whatser::Collection.new(res.data)
 
        collection.data = res.data
        res.data = collection
        return res
      end             
    end
    
    def add(poi_id, opts={})
      Whatser::Collection.add(poi_id, opts)
    end
    
    def delete(poi_id)
      Whatser::Collection.delete(poi_id, opts)
    end      
    
    def initialize(collection_data=nil)
      self.data = collection_data || []
      set_city
    end      
    
    def each(&block)
      (data || []).each(&block)
    end      
    
    def size
      (data || []).size
    end
    
  private      
    
    def set_city
      self.city ||= []
      data.each do |poi|
        next unless poi.is_a?(Whatser::Poi)
        self.city << poi.city unless city.include?(poi.city)
      end
      self.city_name = city.join(", ")
    end
  end
end