module SoGeo
  module Hondius
    class Poi < SoGeo::Hondius::Resource
      attr_accessor :id,:user_id,:gowalla_id,:foursquare_id
      attr_accessor :name,:lat,:lng,:street,:district,:region,:city,:postal_code,:country
      attr_accessor :tag_list,:created_at
      
      class << self
        def suggested(opts={})
          api_request :get, "/poi/suggested", {:query => opts}
        end

        def search(opts={})
          api_request :get, "/poi", {:query => opts}
        end
        
        def find(id, opts={})
          api_request :get, "/poi/#{id}", {:query => opts}
        end
        
        def create(opts={})
          api_request :post, "/poi", {:query => {'poi' => opts} }
        end
      end
      
      def save
        if id.blank?
          api_request :post, "/poi", {:body => {'poi' => to_params} }
        else
          api_request :put, "/poi/#{id}", {:body => {'poi' => to_params} }
        end
      end
      
      def delete
        api_request :delete, "/poi/#{id}"
      end
      
      def tags(opts={})
        SoGeo::Hondius::Tag.list(id, opts)
      end

      def media(opts={})
        SoGeo::Hondius::Media.list(id, opts)
      end
      
      def reviews(opts={})
        SoGeo::Hondius::Review.list(id, opts)
      end
      
      def details(opts={})
        SoGeo::Hondius::Detail.list(id, opts)
      end            
      
      def to_params
        {:name=>name,:lat=>lat,:lng=>lat,:street=>street,:district=>district,
         :region=>region,:city=>city,:postal_code=>postal_code,:country=>country}
      end
    end
  end
end