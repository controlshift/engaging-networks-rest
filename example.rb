$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'engaging_networks_rest'
require 'faraday/detailed_logger'
require 'byebug'

def instrument_connection_with_extended_logging(client)
  default_options = {
    headers: {
      'Accept' => "application/json;q=0.1",
      'Accept-Charset' => "utf-8"
    }
  }

  faraday_builder = ->(faraday) do
    faraday.response :detailed_logger
    faraday.adapter Faraday.default_adapter
  end

  instrumented_connection = Faraday.new(
    default_options.merge(url: "https://#{EngagingNetworksRest::Client::ENS_DOMAIN}"),
    &faraday_builder
  )
  client.instance_variable_set(:@connection, instrumented_connection)
end

client = EngagingNetworksRest.new(api_key: ENV['EN_API_KEY'])
instrument_connection_with_extended_logging(client)

byebug

puts "Bye!"
