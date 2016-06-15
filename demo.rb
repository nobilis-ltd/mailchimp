require 'mailchimp'

Mailchimp.configure do |config|
  config.api_key = '043dcee5b459256106d0787ddb04fa2f-us13'
  config.list_id = 'ee2ad3a90d'
  config.data_center = 'us13'
end

p Mailchimp::Member.subscribe({
  email_address: "foo@example.com",
  merge_fields: {
      "FNAME" => "Foo" , 
      "LNAME" => "Example"
  }
})

# p Mailchimp::Member.remove_from_list("foo@example.com")
