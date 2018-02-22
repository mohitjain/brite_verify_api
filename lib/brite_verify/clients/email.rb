module BriteVerify
  module Clients
    class Email < Base
      API_PATH = '/emails.json'
      attr_accessor :email

      def initialize(email = nil)
        @email = email
      end

      def execute
        if BriteVerify.configuration.default_email_api_reponse.present?
          return RecursiveOpenStruct.new(BriteVerify.configuration.default_email_api_reponse)
        end
        options = { address: email }
        data = get path, options
      end

      private

      def path
        API_HOST + API_PATH
      end

    end
  end
end
