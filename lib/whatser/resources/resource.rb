module Whatser
  class Resource
    attr_accessor :json
    
    class << self   
      def client
        @client
      end
      
      def set(client)
        @client = client
        self
      end
      
      def api_request(verb, path, params={}, opts={})
        res = client.request(verb, path, params)
        res.data = convert_data_to_model( res.data, opts)
        return res
      end

      def convert_data_to_model(data, opts={})
        return data if data.blank?
        opts ||= {}

        data = if data.is_a?(Array)
          data.inject([]) {|result,d| result << from_hash_to_model(d, opts[:model]) }
        else
          from_hash_to_model(data, opts[:model])
        end
        data
      end
      
      def from_hash_to_model(hash, model=nil)
        hash ||= {}
        hash = hash.size == 1 ? hash.first.last : hash
        mod = model.blank? ? new : model.new
        hash.each do |k,v|
          mod.send("#{k}=", v) if mod.respond_to?(k)
        end
        mod.json = hash.to_json
        return mod
      end
    end
    
    def initialize(params={})
      params.each_pair { |k,v| send("#{k}=", v) if respond_to?(k) }
    end
    
    def api_request(verb, path, params={}, opts={})
      self.class.api_request(verb, path, params, opts)
    end
  end
end