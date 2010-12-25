module Whatser
  class Poi < Whatser::Resource
    attr_accessor :id,:user_id,:gowalla_id,:foursquare_id
    attr_accessor :name,:lat,:lng,:street,:district,:region,:city,:postal_code,:country
    attr_accessor :tag_list,:created_at
    
    class << self
      def suggested(opts={})
        api_request :get, "/api/poi/suggested", {:query => opts}
      end

      def search(opts={})
        api_request :get, "/api/poi", {:query => opts}
      end
      
      def find(id, opts={})
        api_request :get, "/api/poi/#{id}", {:query => opts}
      end
      
      def create(params={})
        api_request :post, "/api/poi", {:body => {'poi' => params} }
      end
      
      def delete(poi_id)
        api_request :delete, "/api/poi/#{poi_id}"
      end        
    end
    
    def save
      if id.blank?
        self.class.create(to_params)
      else
        api_request :put, "/api/poi/#{id}", {:body => {'poi' => to_params} }
      end
    end
    
    def delete
      Whatser::Poi.delete(id)
    end
    
    def tag(tag_name)
      Whatser::Tag.create(id, tag_name)
    end
    
    def tags(opts={})
      Whatser::Tag.list(id, opts)
    end

    def media(opts={})
      Whatser::Media.list(id, opts)
    end
    
    def reviews(opts={})
      Whatser::Review.list(id, opts)
    end
    
    def details(opts={})
      Whatser::Detail.list(id, opts)
    end            
    
    def foursquare_connected?
      !foursquare_id.blank?
    end
    
    def gowalla_connected?
      !gowalla_id.blank?
    end      
    
    def to_params
      {:name=>name,:lat=>lat,:lng=>lat,:street=>street,:district=>district,
       :region=>region,:city=>city,:postal_code=>postal_code,:country=>country}
    end
  end
end