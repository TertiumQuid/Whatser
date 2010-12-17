module SoGeo
  module Hondius
    module Http
      include HTTParty
      
      def self.included(base)
        base_uri base.api_uri
      end
      
      def request(verb, path, params={}, options={})
        response = self.class.send( verb, path, default_request_options.merge( params ) )
        SoGeo::Hondius::Response.new( response.body )
      end
      
private

      def default_request_options
        return {:query => {:oauth_token => oauth_token}, :body => {}}
      end
    end
  end
end
