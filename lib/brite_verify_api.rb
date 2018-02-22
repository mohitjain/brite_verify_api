require_relative "brite_verify_api/version"
require_relative "brite_verify_api/configuration/base"
require "httparty"
module BriteVerifyApi
  def self.configuration
    @configuration ||= BriteVerifyApi::Configuration::Base.new
  end

  def self.configuration=(configuration)
    @configuration = configuration
  end

  def self.configure
    yield configuration if block_given?
  end

  def self.reset
    @configuration = nil
  end
end
require_relative "brite_verify_api/clients/base"
require_relative "brite_verify_api/clients/email"
require_relative "brite_verify_api/error"
