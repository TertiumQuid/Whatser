module Whatser
  class Twitter < Whatser::Service
    @key = 'twitter'      
  
    def get_friends(opts={})
      api_request :get, "/oauth/services/twitter/friends", {:query => opts}, :model => Whatser::User
    end
  
    def status_update(status, params={})
      api_request :post, "/oauth/services/twitter/publish", {:body => {'status' => status}.merge(params) }
    end      
  end
end