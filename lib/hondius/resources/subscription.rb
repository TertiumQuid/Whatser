module Whatser
  class Subscription < Whatser::Resource
    attr_accessor :id,:data_source_id
    attr_accessor :data_source_name,:created_at
    
    class << self
      def list(opts={})
        api_request :get, "/api/subscriptions", {:query => opts}
      end
    end      
  end
end