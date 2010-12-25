module Whatser
  module Http
    include HTTParty
    
    def self.included(base)
      base_uri base.api_uri
    end
    
    def request(verb, path, params={}, options={})
      response = HTTParty.send( verb, compose_url(path), request_options( params ) )
      Whatser::Response.new( response.body, {:code => response.code}.merge(options) ) 
    end
    
  private

    def compose_url(path)
      "#{api_uri}#{path}"
    end

    def request_options(params={})
      params ||= {}
      return { :query => {:oauth_token => oauth_token}.merge(params[:query] || {}), 
               :body => params[:body] }
    end
  end
end
