# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'engaging-networks-rest'
  spec.version       = File.read(File.expand_path('VERSION', __dir__)).strip
  spec.authors       = ['Grey Moore', 'Owens Ehimen', 'Diego Marcet']
  spec.email         = ['talk@controlshiftlabs.com']

  spec.summary       = 'Client gem for the ENS API to Engaging Networks'
  spec.description   = 'Client gem for the ENS API to Engaging Networks'
  spec.homepage      = 'https://github.com/controlshift/engaging-networks-rest'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.required_ruby_version = ['>= 3.3', '< 5.0']

  # Runtime dependencies
  spec.add_runtime_dependency 'faraday', '~> 2.0'

  # Development dependencies
  spec.add_development_dependency 'bundler', '>= 2.0', '< 5.0'
  spec.add_development_dependency 'debug', '~> 1.0'
  spec.add_development_dependency 'faker', '~> 3.0'
  spec.add_development_dependency 'faraday-detailed_logger', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_development_dependency 'webmock', '~> 3.0'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
