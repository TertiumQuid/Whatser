module Whatser
  class Facebook < Whatser::Service
    @key = 'facebook'

    def get_friends(opts={})
      api_request :get, "/oauth/services/facebook/friends", {:query => opts}, :model => Whatser::User
    end    

    def wall_post(params={})
      api_request :post, "/oauth/services/facebook/publish", {:body => params}
    end      
  end
end