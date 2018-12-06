require 'rspec'
require 'webmock/rspec'

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'engaging_networks_rest'

RSpec.configure do |config|
  config.include WebMock::API

  config.before :each do
    WebMock.reset!
  end

  config.after :each do
    WebMock.reset!
  end
end
