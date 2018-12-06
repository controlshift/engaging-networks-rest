require 'faraday'

module EngagingNetworksRest
  class Client
    attr_reader :api_key, :connection, :ens_auth_key

    ENS_DOMAIN = 'www.e-activist.com'.freeze

    def initialize(api_key:)
      @api_key = api_key

      @connection = Faraday.new(url: "https://#{ENS_DOMAIN}")
    end

    def authenticate!
      response = connection.post do |req|
        req.url '/ens/service/authenticate'
        req.headers['Content-Type'] = 'application/json'
        req.body = api_key
      end

      @ens_auth_key = response.body
    end
  end
end
