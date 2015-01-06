require "net/http"
require "uri"

module PushNinja
  class Exporter

    # Send device to push_ninja
    def self.send_device(device_data)
      uri = URI self.url_from_env
      @api_request ||= prepare_push_ninja_api_headers(uri)
      @api_request.body = device_data.to_json
      response = Net::HTTP.new(uri.host, uri.port).start do |http|
        http.request(@api_request)
      end
      Rails.logger.debug "Response #{response.code} #{response.message}:
            #{response.body}"
    end

    private
      # Prepare an URI to PushNinja
      def self.prepare_push_ninja_api_headers(uri)
        api_request = Net::HTTP::Post.new uri.request_uri, initheader = {
          'Content-Type' => 'application/json',
          'Authorization' => 'Token token="%s"' % PushNinja.authentification_token,
          'Accept' => 'application/json'
        }

        api_request
      end

      def self.url_from_env
        case PushNinja.env
        when :staging
          "http://fb-staging-mnms.herokuapp.com/api/devices"
        when :production
          "http://fb-production-mnms.herokuapp.com/api/devices"
        end
      end

  end
end
