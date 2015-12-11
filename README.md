# Slackpolice

Slackpolice is Slack administration tools.

* Archive non members channels.
* Delete old files.

## Installation

    $ gem install slackpolice

## Usage

```
Commands:
  slackpolice archive --api-token=API_TOKEN       # archive no members channels
  slackpolice help [COMMAND]                      # Describe available commands or one specific command
  slackpolice remove_files --api-token=API_TOKEN  # remove expired files
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec slackpolice` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/slackpolice. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

