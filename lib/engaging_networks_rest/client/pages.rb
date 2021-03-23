# frozen_string_literal: true

module EngagingNetworksRest
  class Client
    module Pages
      def pages(type:, status: nil)
        filter_params = { 'type' => type }
        filter_params['status'] = status unless status.nil?

        get(path: '/ens/service/page', params: filter_params)
      end

      def page(page_id:)
        get(path: "/ens/service/page/#{page_id}")
      end

      def process_page_request(page_id:, supporter_data:, generic_data: {})
        response = post(path: "/ens/service/page/#{page_id}/process",
                        body: generic_data.merge(supporter: supporter_data))
        return response if response['status'] == 'SUCCESS'

        raise "Unexpected 'status' value on response: #{response}"
      end
    end
  end
end
