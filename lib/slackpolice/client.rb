require 'slack-api-wrapper'
require 'logger'
require 'date'

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

    def delete_expired_files
      deleted_files = []

    end

    def no_members_channels
      @client.channels_list['channels'].select do |c|
        c['num_members'] == 0 && c['is_archived'] == false
      end
    end

    def expired_files(ts_to = Date.today.prev_day(7))
      page = 1
      Enumerator.new do |y|
        begin
          resp = @client.files_list('ts_to' => ts_to.to_time.to_i, 'page' => page)
          if resp['ok']
            pages = resp['paging']['pages']
            resp['files'].map do |file|
              y << file
            end
          end
          page += 1
        end while pages > page || 100 > page # over 100 page is not found. api bug?
      end
    end
  end
end
