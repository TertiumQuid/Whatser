module SoGeo
  module Hondius
    class Client
      ['net','client','api'].each do |p| 
        Dir[File.expand_path("/#{p}/*.rb", __FILE__)].each{|f| require f} 
      end

      class << self      
        attr_accessor *SoGeo::Hondius::Configuration::VALID_OPTIONS_KEYS
        
        def configure
          yield self
          true
        end
      end
      
      attr_accessor  *SoGeo::Hondius::Configuration::VALID_OPTIONS_KEYS
      def initialize(options={})
        SoGeo::Hondius::Configuration::VALID_OPTIONS_KEYS.each do |key|
          if options[key].blank?
            send("#{key}=", self.class.send(key) )
          else  
            send("#{key}=", options[key])
          end
        end
      end
      
      def check_ins; SoGeo::Hondius::CheckIn.set(self); end
      def collections; SoGeo::Hondius::Collection.set(self); end
      def data_sources; SoGeo::Hondius::DataSource.set(self); end
      def details; SoGeo::Hondius::Detail.set(self); end
      def media; SoGeo::Hondius::Media.set(self); end
      def spots; SoGeo::Hondius::Poi.set(self); end
      def users; SoGeo::Hondius::User.set(self); end
      def reviews; SoGeo::Hondius::Review.set(self); end
      def subscriptions; SoGeo::Hondius::Subscription.set(self); end
      def tags; SoGeo::Hondius::Tag.set(self); end
   
      include SoGeo::Hondius::Configuration   
      include SoGeo::Hondius::Http
      include SoGeo::Hondius::OAuth
    end   
  end
end