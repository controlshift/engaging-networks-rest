# frozen_string_literal: true

require 'engaging_networks_rest/client'

module EngagingNetworksRest
  class << self
    def new(api_key:, host: EngagingNetworksRest::Client::ENS_DOMAIN)
      EngagingNetworksRest::Client.new(api_key: api_key, host: host)
    end
  end
end
