$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fake_email_validator'

require 'minitest/autorun'

I18n.enforce_available_locales = true
