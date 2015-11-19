require 'slack-ruby-client'
require 'dotenv'
Dotenv.load

Slack.configure do |config|
  config.token = ENV['TOKEN']
end

client = Slack::RealTime::Client.new

client.on :message do |data|
  puts data
  if data["channel"] == ENV['CHANNEL'] && data["text"] == "Hi bot!"
    client.web_client.chat_postMessage({channel: ENV['CHANNEL'], text: 'Whats up! '})
  end
end

client.start!
