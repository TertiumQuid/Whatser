module SoGeo
  module Hondius
    module Configuration
      VALID_OPTIONS_KEYS = [:api_key,:api_secret,:username,:password,:oauth_token,:api_uri,:redirect_uri]
      
      DEFAULT_API_URI = 'https://production-2.sogeoapi.com'.freeze

      def self.included(base)
        base.api_key       = nil
        base.api_secret    = nil
        base.oauth_token   = nil
        base.redirect_uri  = nil
        base.api_uri       = DEFAULT_API_URI
      end
    end
  end
end