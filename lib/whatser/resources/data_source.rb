module Whatser
  class DataSource < Whatser::Resource
    attr_accessor :id
    attr_accessor :name,:price,:review_count,:media_count,:collection_count,:poi_count
    attr_accessor :users
    
    class << self
      def list(opts={})
        api_request :get, "/api/data_sources", {:query => opts}
      end
    end
    
    def subscription_url(opts={})
      url = "#{self.class.client.api_uri}/payments/data_sources/#{id}/orders/new?oauth_token=#{self.class.client.oauth_token}"
      url = "#{url}&#{opts.to_params}" unless opts.blank?
      url
    end
  end
end