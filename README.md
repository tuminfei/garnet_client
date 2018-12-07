# GarnetClient

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/garnet_client`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'garnet_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install garnet_client

## Usage

```ruby
##################TEST##################
# 接口地址
GarnetClient.api_base_url = 'http://13.125.135.44'
# 商户账号
GarnetClient.tenant_id = 'rnet'
# TOKEN
GarnetClient.tenant_token = 'eyJhbGciOiJIUzUxMiJ9.eyJ0ZW5hbnRfaWQiOiJybmV0IiwidGltZXN0YW1wIjp7Im5hbm8iOjk3MDAwMDAwLCJlcG9jaFNlY29uZCI6MTU0NDE2ODQ1N319.bXQ7NsqXcBz3ZQjZpVGR4eFQqoPLyJbdc0IFmq574N10wfY7BdbBOxjTrznov5RA8xQE3VxlOVZFG_u2e5EylA'

##################PROD##################
# # 接口地址
# GarnetClient.api_base_url = 'http://13.125.135.44'
# # 商户账号
# GarnetClient.tenant_id = 'rnet'
# # TOKEN
# GarnetClient.tenant_token = 'eyJhbGciOiJIUzUxMiJ9.eyJ0ZW5hbnRfaWQiOiJybmV0IiwidGltZXN0YW1wIjp7Im5hbm8iOjk3MDAwMDAwLCJlcG9jaFNlY29uZCI6MTU0NDE2ODQ1N319.bXQ7NsqXcBz3ZQjZpVGR4eFQqoPLyJbdc0IFmq574N10wfY7BdbBOxjTrznov5RA8xQE3VxlOVZFG_u2e5EylA'

```
Add Migration

```ruby
rails g garnet_client:migration
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/garnet_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GarnetClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/garnet_client/blob/master/CODE_OF_CONDUCT.md).
