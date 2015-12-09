require 'thor'

module Slackpolice
  class CLI < Thor

    desc :archive, "archive no members channels"
    method_option :api_token, type: :string, required: true
    def archive
      archived_channels = client.archive
      archived_channels.each do |c|
        puts "archived: ##{c['name']}"
      end
    end

    private

    def client
      @client ||= Slackpolice::Client.new options
    end
  end
end
