module Whatser
  class Poi < Whatser::Resource
    attr_accessor :id,:user_id,:gowalla_id,:foursquare_id
    attr_accessor :name,:opening_times,:directions,:payment_methods,:pricing,:website,:phone_number
    attr_accessor :lat,:lng,:street,:district,:region,:city,:postal_code,:country
    attr_accessor :tag_list,:created_at,:branded_tags
    
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
    
    def branded_tags=(val)
      if val.is_a?(Array)
        @branded_tags = []
        val.each do |tag|
          if tag.is_a?(Whatser::Tag)
            @branded_tags << tag
          else
            @branded_tags << Resource.from_hash_to_model(tag, Whatser::Tag)
          end
        end
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
    
    def activity(opts)
      Whatser::ActivityFeed.set(self.class.client).spot( self.id, opts )
    end
    
    def comments(opts={})
      Whatser::Comment.set(self.class.client).poi(id, opts)
    end
    
    def visitors(opts={})
      Whatser::User.set(self.class.client).visitors(id, opts)
    end
    
    def collectors(opts={})
      Whatser::User.set(self.class.client).collectors(id, opts)
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