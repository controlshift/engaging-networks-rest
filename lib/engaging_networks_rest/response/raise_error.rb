# frozen_string_literal: true

module EngagingNetworksRest
  module Response
    class NotFound < StandardError; end

    class Unauthorized < StandardError; end

    class InternalError < StandardError; end

    class RaiseError < Faraday::Response::Middleware
      def on_complete(response)
        status_code = response[:status].to_i
        if (400...600).include? status_code
          case status_code
          when 401
            raise Unauthorized, error_message(response)
          when 404
            raise NotFound, error_message(response)
          when 500
            raise InternalError, error_message(response)
          else
            raise StandardError, error_message(response)
          end
        end
      end

      def error_message(response)
        "#{response[:method].to_s.upcase} #{response[:url]}: #{response[:status]} \n\n #{response[:body]}"
      end
    end
  end
end
