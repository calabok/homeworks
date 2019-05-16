require 'webmock/rspec'
require_relative '../mentor'
require_relative '../student'
require_relative '../homework'
require_relative '../notification'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /www.example.com/)
      .to_return(status: '200')
  end
end
