# fake_email_validator [![Build Status](https://travis-ci.org/maxd/fake_email_validator.png?branch=master)](https://travis-ci.org/maxd/fake_email_validator)

E-Mail validator for block services like mailinator.com, dropmail.me, etc. during new user registration.

## Installation

Add this line to your application's Gemfile:

    gem 'fake_email_validator', '~> 1.0.1'

## How to use?

Just add validator to your User model:

    validates :email, fake_email: true

## FAQ

### Where is a list of blocked domains?

It is [here](https://github.com/maxd/fake_email_validator/blob/master/config/fake_domains.list).

## Contributing

1. Fork it ( http://github.com/maxd/fake_email_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
