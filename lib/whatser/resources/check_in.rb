module Whatser
  class CheckIn < Whatser::Resource
    attr_accessor :id,:user_id,:poi_id
    attr_accessor :name,:lat,:lng,:check_in_at,:check_out_at,:rating,:message
    attr_accessor :locate_user, :gowalla_share, :foursquare_share
 
    class << self
      def list(opts={})
        api_request :get, "/api/check_ins", {:query => opts}
      end
      
      def create(poi_id, params={})
        api_request :post, "/api/poi/#{poi_id}/check_ins", {:body => {'check_in' => params} }
      end        
    end      
    
    def save
      self.class.create( self.poi_id, self.to_params )
    end
    
    def to_params
      {:lat => lat, :lng => lng, :locate => locate_user, :gowalla => gowalla_share, :foursquare => foursquare_share, :check_in_at => check_in_at, :check_out_at => check_out_at}
    end      
  end
end