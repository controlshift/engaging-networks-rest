# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'engaging_networks_rest/client/pages'
require 'engaging_networks_rest/response/raise_error'

module EngagingNetworksRest
  class Client
    attr_reader :api_key, :connection, :ens_auth_key

    ENS_DOMAIN = 'www.e-activist.com'

    def initialize(api_key:)
      @api_key = api_key

      @connection = Faraday.new(url: "https://#{ENS_DOMAIN}") do |conn|
        conn.request :json
        conn.response :json, content_type: /\bjson$/

        conn.use Faraday::Response::Logger if ENV['DEBUG']
        conn.use EngagingNetworksRest::Response::RaiseError

        conn.adapter :net_http
      end
    end

    def authenticate!
      response = connection.post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.url '/ens/service/authenticate'
        req.body = api_key
      end

      @ens_auth_key = response.body['ens-auth-token']
    end

    def authenticated?
      !ens_auth_key.nil?
    end

    def get(path:, params: {})
      request(method: :get, path: path, params: params)
    end

    def post(path:, body: {})
      request(method: :post, path: path, body: body)
    end

    include EngagingNetworksRest::Client::Pages

    private

    def request(method:, path:, params: {}, body: {})
      authenticate! unless authenticated?

      response = connection.send(method) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.path = path
        req.params = params
        req.headers['ens-auth-token'] = ens_auth_key
        req.body = ::JSON.generate(body) unless body.empty?
      end

      response.body
    end
  end
end
