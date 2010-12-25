module Whatser
  class Follow < Whatser::Resource
    attr_accessor :id
    attr_accessor :name,:avatar_pic,:location
    attr_accessor :promoted,:premium,:collections_count
    attr_accessor :following,:followed,:foaf_count,:foaf
    
    class << self
      def list(opts={})
        api_request :get, "/api/follows", {:query => opts}
      end
      
      def suggested(opts={})
        api_request :get, "/api/users/suggested", {:query => opts}
      end        
      
      def create(user_id, opts={})
        api_request :post, "/api/follows/#{user_id}", {:query => opts, :body => ''}
      end

      def delete(user_id)
        api_request :delete, "/api/follows/#{user_id}"
      end
      
      def ignore(user_id)
        api_request :delete, "/api/follows/#{user_id}"
      end
      
      def connection(user_id)
        api_request :get, "/api/users/#{user_id}/connection"
      end        
    end
    
    def save
      self.class.create( id )
    end      
    
    def delete
      self.class.ignore( id )
    end
  end
end