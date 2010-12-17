module SoGeo
  module Hondius
    class DataSource < SoGeo::Hondius::Resource
      attr_accessor :id
      attr_accessor :name,:price,:review_count,:media_count,:collection_count,:poi_count
      attr_accessor :users
      
      class << self
        def list(opts={})
          api_request :get, "/data_sources", {:query => opts}
        end
      end      
    end
  end
end