module Whatser
  class Foursquare < Whatser::Service
    @key = 'foursquare'

    class << self
      def get_friends(opts={})
        api_request :get, "/oauth/services/foursquare/friends", {:query => opts}, :model => Whatser::User
      end    
    end
  end
end