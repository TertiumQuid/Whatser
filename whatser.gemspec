# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{whatser}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Travis Dunn"]
  s.date = %q{2011-02-03}
  s.description = %q{The 'Whatser API' Gem is a simple Ruby / Rails wrapper for interacting with Whatser's location-based web services (see http://docs.sogeoapi.com for more details).}
  s.email = %q{cmd@travisdunn.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/whatser.rb",
    "lib/whatser/api/batch.rb",
    "lib/whatser/api/facebook.rb",
    "lib/whatser/api/foursquare.rb",
    "lib/whatser/api/gowalla.rb",
    "lib/whatser/api/response.rb",
    "lib/whatser/api/service.rb",
    "lib/whatser/api/twitter.rb",
    "lib/whatser/client.rb",
    "lib/whatser/configuration.rb",
    "lib/whatser/errors.rb",
    "lib/whatser/net/http.rb",
    "lib/whatser/net/oauth.rb",
    "lib/whatser/resources/activity_feed.rb",
    "lib/whatser/resources/check_in.rb",
    "lib/whatser/resources/city.rb",
    "lib/whatser/resources/collection.rb",
    "lib/whatser/resources/comment.rb",
    "lib/whatser/resources/data_source.rb",
    "lib/whatser/resources/detail.rb",
    "lib/whatser/resources/follow.rb",
    "lib/whatser/resources/media.rb",
    "lib/whatser/resources/poi.rb",
    "lib/whatser/resources/resource.rb",
    "lib/whatser/resources/review.rb",
    "lib/whatser/resources/subscription.rb",
    "lib/whatser/resources/tag.rb",
    "lib/whatser/resources/user.rb",
    "test/helper.rb",
    "test/test_activity_feed.rb",
    "test/test_check_in.rb",
    "test/test_city.rb",
    "test/test_client.rb",
    "test/test_collection.rb",
    "test/test_comment.rb",
    "test/test_configuration.rb",
    "test/test_data_source.rb",
    "test/test_detail.rb",
    "test/test_facebook.rb",
    "test/test_follow.rb",
    "test/test_foursquare.rb",
    "test/test_gowalla.rb",
    "test/test_hondius.rb",
    "test/test_http.rb",
    "test/test_oauth.rb",
    "test/test_poi.rb",
    "test/test_resource.rb",
    "test/test_response.rb",
    "test/test_review.rb",
    "test/test_service.rb",
    "test/test_subscription.rb",
    "test/test_tag.rb",
    "test/test_twitter.rb",
    "test/test_user.rb",
    "whatser.gemspec"
  ]
  s.homepage = %q{http://github.com/sogeo/whatser}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{An HTTP and model DSL wrapper for the Whatser API}
  s.test_files = [
    "test/helper.rb",
    "test/test_activity_feed.rb",
    "test/test_check_in.rb",
    "test/test_city.rb",
    "test/test_client.rb",
    "test/test_collection.rb",
    "test/test_comment.rb",
    "test/test_configuration.rb",
    "test/test_data_source.rb",
    "test/test_detail.rb",
    "test/test_facebook.rb",
    "test/test_follow.rb",
    "test/test_foursquare.rb",
    "test/test_gowalla.rb",
    "test/test_hondius.rb",
    "test/test_http.rb",
    "test/test_oauth.rb",
    "test/test_poi.rb",
    "test/test_resource.rb",
    "test/test_response.rb",
    "test/test_review.rb",
    "test/test_service.rb",
    "test/test_subscription.rb",
    "test/test_tag.rb",
    "test/test_twitter.rb",
    "test/test_user.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<oauth2>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<oauth2>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<oauth2>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

