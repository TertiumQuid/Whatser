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

    def request_options(params={}, options={})
      params ||= {}
      return { :query => query_options(params[:query], options), :body => params[:body] }
    end
    
    def query_options(params, options={})
      base = options[:auth] == :key ? {:client_id => api_key} : {:oauth_token => oauth_token}
      base.merge( params || {} )
    end
  end
end
