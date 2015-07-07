require 'active_model'
require 'fake_email_service'

class FakeEmailValidator < ActiveModel::EachValidator

  I18N_SCOPE = 'fake_email_validator.validations.email'

  cattr_accessor :fake_email_service do
    FakeEmailService.new
  end

  def initialize(options)
    super(options)
  end

  def validate_each(record, attribute, value)
    record.errors.add attribute, I18n.t(:fake, scope: I18N_SCOPE) if fake_email_service.is_fake_email?(value)
  rescue Mail::Field::ParseError, FakeEmailException
    record.errors.add attribute, I18n.t(:invalid, scope: I18N_SCOPE)
  end

end

ActiveSupport.on_load(:i18n) do
  I18n.load_path << File.expand_path('../../config/locales/en.yml', __FILE__)
end