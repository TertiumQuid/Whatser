module Whatser
  class Subscription < Whatser::Resource
    attr_accessor :id,:data_source_id
    attr_accessor :data_source_name,:created_at
    
    class << self
      def list(params={})
        api_request :get, "/api/subscriptions", {:query => params}
      end
    end      
  end
end