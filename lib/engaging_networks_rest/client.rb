require 'faraday'

require 'engaging_networks_rest/client/pages'

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

    def authenticated?
      !ens_auth_key.nil?
    end

    def post(path:, body: {})
      request(method: :post, path: path, body: body)
    end

    include EngagingNetworksRest::Client::Pages

    private

    def request(method:, path:, params: {}, body: {})
      unless authenticated?
        authenticate!
      end

      response = connection.send(method) do |req|
        req.path = path
        req.params = params
        req.headers['Content-Type'] = 'application/json'
        req.headers['ens-auth-token'] = ens_auth_key
        req.body = ::JSON.generate(body) unless body.empty?
      end

      JSON.parse(response.body)
    end
  end
end
