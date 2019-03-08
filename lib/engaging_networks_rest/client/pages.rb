module EngagingNetworksRest
  class Client
    module Pages
      def pages(type:, status: nil)
        filter_params = {'type' => type}
        unless status.nil?
          filter_params['status'] = status
        end

        get(path: "/ens/service/page", params: filter_params)
      end

      def page(page_id:)
        get(path: "/ens/service/page/#{page_id}")
      end

      def process_page_request(page_id:, supporter_data:)
        response = post(path: "/ens/service/page/#{page_id}/process", body: {supporter: supporter_data})
        if response['status'] == 'SUCCESS'
          return response['id']
        end

        raise "Unexpected 'status' value on response: #{response}"
      end
    end
  end
end
