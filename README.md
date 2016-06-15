# Mailchimp

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mailchimp`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mailchimp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mailchimp

## Usage
This gem should help you easily remove/add subscribers to a list in mailchimp account

To start using the gem :

a) First configure mailchimp account details(api key , list id and data center) as follows:

```ruby
	Mailchimp.configure do |config|
	  config.api_key = '.....your api key.......'
	  config.list_id = '........specific list id......'
	  config.data_center = '.......your data center(can be found as last part of api key)......'
	end
```

b) Then to add a subscriber to a list do the following:

```ruby
	Mailchimp::Member.subscribe({
		email_address: "foo@example.com",
		merge_fields: {
		    "FNAME" => "Foo" , 
		    "LNAME" => "Example"
		}
	})
```

c) To delete a subscriber from the list do the following:
```ruby
	Mailchimp::Member.remove_from_list("foo@example.com")	
```

d) If you are successful in either adding or removing you should get a message that looks as such:

`>> {:success=>true, :message=>""}`

e) If you are unsuccessful in either adding or removing you should get a message that looks as such:

`>> {:success=>false, :message=>"error message e.g Member already exists"}`

	

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Martin-Nyaga/nobilis-forge/tree/master/mailchimp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

