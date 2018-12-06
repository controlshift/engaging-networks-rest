module EngagingNetworksRest
  class Client
    module Pages
      def process_page_request(page_id:, body:)
        post(path: "/ens/service/page/#{page_id}/process", body: body)
      end
    end
  end
end
