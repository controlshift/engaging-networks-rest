# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "engaging-networks-rest".freeze
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Grey Moore".freeze]
  s.date = "2023-10-16"
  s.description = "Client gem for the ENS API to Engaging Networks".freeze
  s.email = "systems@controlshiftlabs.com".freeze
  s.extra_rdoc_files = [
    "LICENSE",
    "LICENSE.txt",
    "README.md"
  ]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  s.homepage = 'https://github.com/controlshift/engaging-networks-rest'.freeze
  s.licenses = ["MIT".freeze]
  s.summary = "Client gem for the ENS API to Engaging Networks".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  s.add_runtime_dependency(%q<faraday>.freeze, [">= 1.0"])
  s.add_runtime_dependency(%q<faraday_middleware>.freeze, [">= 0"])

  s.add_development_dependency(%q<faker>.freeze, ["> 1.9"])
  # See https://github.com/faker-ruby/faker/issues/2330
  s.add_development_dependency(%q<psych>.freeze, ["= 3.3.2"])
  s.add_development_dependency(%q<faraday-detailed_logger>.freeze, [">= 2.1.2"])
  s.add_development_dependency(%q<debug>.freeze, ["> 0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<webmock>.freeze, ["> 3.4"])
end
