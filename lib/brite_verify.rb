require_relative "brite_verify/version"
require_relative "brite_verify/configuration/base"
require "httparty"
module BriteVerify
  def self.configuration
    @configuration ||= BriteVerify::Configuration::Base.new
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
require_relative "brite_verify/clients/base"
require_relative "brite_verify/clients/email"
require_relative "brite_verify/error"
