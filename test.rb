require 'slack-ruby-client'
require 'dotenv'
Dotenv.load

Slack.configure do |config|
  config.token = ENV['TOKEN']
end

client = Slack::Web::Client.new
client.channels_list