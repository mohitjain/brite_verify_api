# brite_verify_api

An unofficial Ruby client for the [BriteVerify](https://www.briteverify.com/) email verification API.

> Not affiliated with BriteVerify. The gem is at version 0.1.0 and covers one call: verifying a single email address.

## Install

```ruby
gem 'brite_verify_api'
```

Then `bundle`, or `gem install brite_verify_api`. It uses `httparty` and `recursive-open-struct`.

## Configure

In a Rails app, `config/initializers/brite_verify_api.rb`:

```ruby
BriteVerifyApi.configure do |config|
  config.api_key = ENV.fetch("BRITEVERIFY_API_KEY")
end
```

Keep the key in an environment variable or your credentials store, never in the repository.

## Verify an email

```ruby
response = BriteVerifyApi::Clients::Email.new("johndoe@example.com").verify

response.status        # => "valid"
response.disposable    # => false
response.role_address  # => false
```

The response is the API's JSON as a nested struct. A non-200 reply, a network failure or an unparsable body raises
`BriteVerifyApi::Error`.

## Don't pay for calls while developing

BriteVerify charges per request. Set `default_email_api_reponse` (the spelling is part of the gem's API) and `verify`
returns that hash as a struct without calling the service:

```ruby
BriteVerifyApi.configure do |config|
  config.api_key = ENV.fetch("BRITEVERIFY_API_KEY")
  config.default_email_api_reponse = {
    address: "johndoe@briteverify.com",
    account: "johndoe",
    domain: "briteverify.com",
    status: "valid",
    disposable: false,
    role_address: false,
    duration: 0.104516605
  } if Rails.env.development?
end
```

## Development

```
bin/setup        # install dependencies
bundle exec rake spec
bin/console      # a console with the gem loaded
```

Releases: bump `lib/brite_verify_api/version.rb`, then `bundle exec rake release`.

## Contributing

Bug reports and pull requests are welcome at https://github.com/mohitjain/brite_verify_api. Contributors are expected
to follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

[MIT](LICENSE.txt).
