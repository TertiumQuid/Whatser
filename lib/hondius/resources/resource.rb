module SoGeo
  module Hondius
    class Resource
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
          res.data = convert_data_to_model( res.data )
          return res
        end

        def convert_data_to_model(data)
          return data if data.blank?

          data = if data.is_a?(Array)
            data.inject([]) {|result,d| result << from_hash_to_model(d) }
          else            
            from_hash_to_model(data)
          end
          data
        end
        
        def from_hash_to_model(hash)
          hash = hash.size == 1 ? hash.first : hash
          mod = new
          hash.each_pair do |k,v|
            mod.send("#{k}=", v) if mod.respond_to?(k)
          end
          return mod
        end
      end
      
      def initialize(params={})
        params.each_pair { |k,v| send("#{k}=", v) if respond_to?(k) }
      end
      
      def api_request(verb, path, opts={})
        self.class.api_request(verb, path, opts)
      end
    end
  end
end