module SoGeo
  module Hondius
    class CheckIn < SoGeo::Hondius::Resource
      attr_accessor :id,:user_id,:poi_id
      attr_accessor :name,:lat,:lng,:check_in_at,:check_out_at,:rating,:message
      attr_accessor :locate_user, :gowalla_share, :foursquare_share
   
      class << self
        def list(opts={})
          api_request :get, "/check_ins", {:query => opts}
        end
                
        def find(poi_id, id, opts={})
          api_request :get, "/poi/#{poi_id}/reviews/#{id}", {:query => opts}
        end
        
        def create(poi_id, opts={})
          api_request :post, "/poi/#{poi_id}/check_ins", {:body => {'check_in' => to_params} }
        end        
      end      
      
      def to_params
        {:lat => lat, :lng => lng, :locate => locate_user, :gowalla => gowalla_share, :foursquare => foursquare_share, :check_in_at => check_in_at, :check_out_at => check_out_at}
      end      
    end
  end
end