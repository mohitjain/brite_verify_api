require "json"
module BriteVerifyApi
  module Clients
    class Base
      include HTTParty
      API_HOST = "https://bpi.briteverify.com".freeze

      def get(url, options = {})
        options[:apikey] = BriteVerifyApi.configuration.api_key
        begin
          response = self.class.get(url, options)
          data = JSON.parse response.body, symbolize_names: true
          case response.code
          when 200
            return RecursiveOpenStruct.new(data)
          else
            raise BriteVerifyApi::Error, data[:errors][:user]
          end
        rescue Errno::ECONNREFUSED => e
          raise BriteVerifyApi::Error, e.message
        rescue HTTParty::Error => e
          raise BriteVerifyApi::Error, e.message
        rescue => e
          raise BriteVerifyApi::Error, e.message
        end
      end
    end
  end
end
