module Mailchimp
  # config class for setting configuration options
  class Config
    attr_accessor :api_key, :list_id, :data_center
  end

  # receive a configuration block and run it with internal config as parameter
  def self.configure 
    yield config
    raise "API KEY must be set" if config.api_key.nil?
    raise "LIST ID must be set" if config.list_id.nil?
    raise "DATA CENTER must be set" if config.data_center.nil?
  end

  def self.config
    @@config ||= Config.new
  end
end