module Whatser
  class Client
    ['net','client','api'].each do |p| 
      Dir[File.expand_path("/#{p}/*.rb", __FILE__)].each{|f| require f} 
    end

    class << self      
      attr_accessor *Whatser::Configuration::VALID_OPTIONS_KEYS
      
      def configure
        yield self
        true
      end
    end
    
    attr_accessor :logger
    attr_accessor  *Whatser::Configuration::VALID_OPTIONS_KEYS
    def initialize(options={})
      Whatser::Configuration::VALID_OPTIONS_KEYS.each do |key|
        if options[key].blank?
          send("#{key}=", self.class.send(key) )
        else  
          send("#{key}=", options[key])
        end
      end
    end
    
    def check_ins; Whatser::CheckIn.set(self); end
    def collections; Whatser::Collection.set(self); end
    def data_sources; Whatser::DataSource.set(self); end
    def media; Whatser::Media.set(self); end
    def spots; Whatser::Poi.set(self); end
    def users; Whatser::User.set(self); end
    def follows; Whatser::Follow.set(self); end
    def subscriptions; Whatser::Subscription.set(self); end
    def tags; Whatser::Tag.set(self); end
    def comments; Whatser::Comment.set(self); end
    def cities; Whatser::City.set(self); end
    def feeds; Whatser::ActivityFeed.set(self); end    
    
    def facebook; Whatser::Facebook.set(self); end
    def foursquare; Whatser::Foursquare.set(self); end
    def gowalla; Whatser::Gowalla.set(self); end
    def twitter; Whatser::Twitter.set(self); end                        
 
    include Whatser::Configuration   
    include Whatser::Http
    include Whatser::OAuth
    
    def authorized?
      !oauth_token.blank?
    end
    
    def log(msg,level=:info)
      return if logger.blank?
      logger.send(level, msg)
    end
  end   
end