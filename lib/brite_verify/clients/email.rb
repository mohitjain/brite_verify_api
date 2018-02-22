module BriteVerify
  module Clients
    class Email < Base
      API_PATH = "/emails.json".freeze
      attr_accessor :email

      def initialize(email = nil)
        @email = email
      end

      def verify
        unless BriteVerify.configuration.default_email_api_reponse.nil?
          return RecursiveOpenStruct.new(
            BriteVerify.configuration.default_email_api_reponse,
          )
        end
        options = { address: email }
        get path, options
      end

      private

      def path
        API_HOST + API_PATH
      end
    end
  end
end
