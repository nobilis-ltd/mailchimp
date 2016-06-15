module Mailchimp
  class Member < Resource
    def self.members_endpoint 
      "lists/#{Mailchimp.config.list_id}/members/"
    end
    # endpoint for all members
    def self.collection_endpoint
      endpoint(members_endpoint)
    end

    # endpoint for single member
    def self.resource_endpoint email
      endpoint(members_endpoint + Digest::MD5.hexdigest(email.downcase))
    end

    def self.subscribe params
      # require email address
      if (params[:email_address] == "" || !params.key?(:email_address))
        raise "email_address is required"
      end

      # Set to subscribed
      params[:status] = "subscribed"

      # make new api call to members collection with parameters
      subscribe = ApiCall.new(collection_endpoint, "post", params)
      response = subscribe.perform
      response_body_hash = JSON.parse(response.body)

      # check for errors and return appropriate response
      if response_body_hash.key? "title"
        wrap_response false, response_body_hash["title"]
      else
        wrap_response true
      end
    end

    def self.remove_from_list email
      # require email address
      raise "email_address is required" if email == ""

      # make new api call to remove member
      remove_from_list = ApiCall.new(resource_endpoint(email), "delete")
      response = remove_from_list.perform

      # check for errors and return appropriate response
      if response.body.nil?
        wrap_response true
      else
        response_body_hash = JSON.parse(response.body)
        wrap_response false, response_body_hash["title"]
      end
    end
  end
end