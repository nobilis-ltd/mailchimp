module Mailchimp
  class Resource
    def self.endpoint path
      URI("https://#{Mailchimp.config.data_center}.api.mailchimp.com/3.0/#{path}")
    end

    def self.wrap_response success, message = ""
      {
        success: success,
        message: message
      }
    end
  end
end