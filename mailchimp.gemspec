# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mailchimp/version'

Gem::Specification.new do |spec|
  spec.name          = "mailchimp"
  spec.version       = Mailchimp::VERSION
  spec.authors       = ["Martin Mwendia" , "Philip Maina" , "Brian Bosire"]
  spec.email         = ["nyaga.martin@nobilisltd.co.ke" , "bosire.brian@nobilisltd.co.ke" , "maina.zak@nobilisltd.co.ke"]

  spec.summary       = %q{This is a ruby api library for version 3.0 of mailchimp email platform }
  spec.description   = File.read(File.join(File.dirname(__FILE__), '/README.md'))
  spec.homepage      = "https://github.com/Martin-Nyaga/nobilis-forge/tree/master/mailchimp"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  # collect all the files beneath the bin, lib, and spec directories and also add in the README,LICENSE, Rakefile , Gemfile files to be included in the gem package
  spec.files         = Dir["{bin,lib}/**/*"].select{ |e| File.file? e } + %w(LICENSE.txt README.md Rakefile demo.rb Gemfile)

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
