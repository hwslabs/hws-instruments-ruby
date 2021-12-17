# Hws::Instruments

This package acts as an adapter to the [hws-connectors](https://github.com/hwslabs/hws-connectors-ruby) package by storing the state information corresponding to connectors. This package introduces 2 entities: `InstrumentConfig` and `Instrument`:

**InstrumentConfig:**

An instrument config encapsulates the state information required to operate on a **hws-connector**. (classes extending `Hws::Connectors` in [hws-connectors](https://github.com/hwslabs/hws-connectors-ruby). e.g.: [Hypto::Payout](https://github.com/hwslabs/hws-connectors-ruby/blob/main/lib/hws-connectors/hypto/payout/base.rb#L1) or [Hypto::VirtualAccount](https://github.com/hwslabs/hws-connectors-ruby/blob/main/lib/hws-connectors/hypto/virtual_account/base.rb#L1))

**Instrument:**

An instrument is an instance of an instrument config mapped to an entity in the connector.

e.g, A VirtualAcount instrument created from instrumentConfig with an account number `HYPTOUAT12324283141087` maps to an actual virtual account created in hypto's end and any operation to be performed on a hypto virtual account can be performed on the instrument with implictly acts on the mapped resource with the help of connector APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hws-instruments'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hws-instruments

## Setup

Instrument configs can be initialized with the help of rake tasks under the namespace `hws-instruments`. 

All available rake tasks can be listed using the command

```sh
rake -T -A
```

Example, The rake task to initialize hypto payouts instrument can be triggered as follows:
```sh
rake hws-instruments:hypto:payouts["<api_token>"]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hws-instruments. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hws::Instruments project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hws-instruments/blob/master/CODE_OF_CONDUCT.md).
