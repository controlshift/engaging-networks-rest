module EngagingNetworksRest
  module Response
    class NotFound < StandardError ; end
    class Unauthorized < StandardError ; end
    class InternalError < StandardError; end

    class RaiseError < Faraday::Response::Middleware
      def on_complete(response)
        status_code = response[:status].to_i
        if (400...600).include? status_code
          case status_code
          when 401
            raise Unauthorized.new(error_message(response))
          when 404
            raise NotFound.new(error_message(response))
          when 500
            raise InternalError.new(error_message(response))
          else
            raise StandardError.new(error_message(response))
          end
        end
      end

      def error_message(response)
        "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]} \n\n #{response[:body] if response[:body]}"
      end
    end
  end
end
