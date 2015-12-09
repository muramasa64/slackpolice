require 'slack-api-wrapper'
require 'logger'

module Slackpolice
  class Client
    def initialize(cli_options = {})
      @cli_options = cli_options
      @logger ||= Logger.new STDOUT

      @client = Slack::Client.new @cli_options[:api_token]
      @client.auth_test
    end

    def archive
      archives = []
      no_members_channels.each do |c|
        resp = @client.channels_archive('channel' => c['id'])
        archives << c if resp['ok']
      end
    end

    def no_members_channels
      @client.channels_list['channels'].select do |c|
        c['num_members'] == 0 && c['is_archived'] == false
      end
    end
  end
end
