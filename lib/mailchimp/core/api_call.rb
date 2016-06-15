module Mailchimp
  class ApiCall
    require 'net/http'
    require 'json'

    attr_accessor :request, :endpoint

    def initialize endpoint, method, params = {}
      # prepare the HTTP method from method string
      method = Object.const_get("Net::HTTP::" + method.downcase.capitalize)

      # set @endpoint instance var to pass to perform block
      @endpoint = endpoint

      # set up HTTP request using method, endpoint and params
      @request = method.new(endpoint)
      @request['Authorization'] = ' apikey ' + "#{Mailchimp.config.api_key}" 
      @request.body = params.to_json
    end

    def perform
      response = 
        Net::HTTP.start(@endpoint.host, @endpoint.port, :use_ssl => @endpoint.scheme == 'https') { |http|
          # issue here is you're using an HTTP library to access an HTTPS service. why we use ssl
          http.request(@request) 
        }
    end
  end
end