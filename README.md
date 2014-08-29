# fake_email_validator

E-Mail validator for Rails to block services like mailinator.com

## Installation

Add this line to your application's Gemfile:

    gem 'fake_email_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_email_validator

## How to use?

Add validator to your User model:

    validates :email, fake_email: true

## Contributing

1. Fork it ( http://github.com/maxd/fake_email_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
