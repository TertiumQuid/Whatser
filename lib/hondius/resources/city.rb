module Whatser
  class City < Whatser::Resource
    attr_accessor :name,:count
    alias :collections_count :count
    
    class << self
      def mine(opts={})
        api_request :get, "/api/users/me/black/book/cities", {:query => opts}
      end
      
      def user(user_id, opts={})
        api_request :get, "/api/users/#{user_id}/black/book/cities", {:query => opts}
      end        
    end      
  end
end