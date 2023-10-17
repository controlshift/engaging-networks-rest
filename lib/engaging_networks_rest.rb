# frozen_string_literal: true

require 'engaging_networks_rest/client'

module EngagingNetworksRest
  class << self
    def new(api_key:, host:)
      EngagingNetworksRest::Client.new(api_key:, host:)
    end
  end
end
