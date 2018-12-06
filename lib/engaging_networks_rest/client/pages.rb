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

      def process_page_request(page_id:, body:)
        post(path: "/ens/service/page/#{page_id}/process", body: body)
      end
    end
  end
end
