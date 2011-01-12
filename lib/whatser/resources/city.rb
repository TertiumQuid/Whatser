module Whatser
  class City < Whatser::Resource
    attr_accessor :name,:count
    alias :collections_count :count
    
    class << self
      def mine(params={})
        api_request :get, "/api/users/me/black/book/cities", {:query => params}
      end
      
      def user(user_id, params={})
        api_request :get, "/api/users/#{user_id}/black/book/cities", {:query => params}
      end        
    end      
  end
end