# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: engaging-networks-rest 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "engaging-networks-rest".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jacinda Moore".freeze]
  s.date = "2021-03-22"
  s.description = "Client gem for the ENS API to Engaging Networks".freeze
  s.email = "jacinda@controlshiftlabs.com".freeze
  s.extra_rdoc_files = [
    "LICENSE",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "engaging-networks-rest.gemspec",
    "example.rb",
    "lib/engaging_networks_rest.rb",
    "lib/engaging_networks_rest/client.rb",
    "lib/engaging_networks_rest/client/pages.rb",
    "lib/engaging_networks_rest/response/raise_error.rb",
    "spec/client/pages_spec.rb",
    "spec/client_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/controlshift/engaging-networks-rest".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Client gem for the ENS API to Engaging Networks".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, [">= 1.0"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.4"])
      s.add_development_dependency(%q<faker>.freeze, ["~> 1.9"])
      s.add_development_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
      s.add_development_dependency(%q<faraday-detailed_logger>.freeze, ["~> 2.1", ">= 2.1.2"])
    else
      s.add_dependency(%q<faraday>.freeze, [">= 1.0"])
      s.add_dependency(%q<faraday_middleware>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.4"])
      s.add_dependency(%q<faker>.freeze, ["~> 1.9"])
      s.add_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
      s.add_dependency(%q<faraday-detailed_logger>.freeze, ["~> 2.1", ">= 2.1.2"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, [">= 1.0"])
    s.add_dependency(%q<faraday_middleware>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.4"])
    s.add_dependency(%q<faker>.freeze, ["~> 1.9"])
    s.add_dependency(%q<pry-byebug>.freeze, ["~> 3.6"])
    s.add_dependency(%q<faraday-detailed_logger>.freeze, ["~> 2.1", ">= 2.1.2"])
  end
end

