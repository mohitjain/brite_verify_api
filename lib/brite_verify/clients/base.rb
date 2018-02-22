require 'json'
require "breaker"
module BriteVerify
  module Clients
    class Base
      include HTTParty
      API_HOST = 'https://bpi.briteverify.com'

      def execute
        raise "Not implemented"
      end

      def get(url, options = {})
        options[:apikey] = BriteVerify.configuration.api_key
        circuit = Breaker.circuit 'brite-verify'
        circuit.run do
          begin
            response = self.class.get(url, options)
            data = JSON.parse response.body, { symbolize_names: true }
            case response.code
              when 200
                return RecursiveOpenStruct.new(data)
              else
                raise BriteVerify::Error, data[:errors][:user]
            end
          rescue Errno::ECONNREFUSED => e
            raise BriteVerify::Error, e.message
          rescue HTTParty::Error => e
            raise BriteVerify::Error, e.message
          rescue => e
            raise BriteVerify::Error, e.message
          end
        end
      end

    end
  end
end
