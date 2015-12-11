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

    desc :remove_files, "remove expired files"
    method_option :api_token, type: :string, required: true
    method_option :days, type: :numeric, default: 7
    method_option :dry_run, type: :boolean, default: false
    def remove_files
      dt = Date.today.prev_day(options['days'])
      if options[:dry_run]
        client.expired_files(dt).each do |f|
          puts "deleted: #{Time.at(f['created'])} #{f['title']} (dry-run)"
        end
      else
        client.delete_expired_files(dt).each do |f|
          puts "deleted: #{Time.at(f['created'])} #{f['title']}"
        end
      end
    end

    private

    def client
      @client ||= Slackpolice::Client.new options
    end
  end
end
