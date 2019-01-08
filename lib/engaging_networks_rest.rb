require 'engaging_networks_rest/client'

module EngagingNetworksRest
  class << self
    def new(api_key:)
      EngagingNetworksRest::Client.new(api_key: api_key)
    end
  end
end
