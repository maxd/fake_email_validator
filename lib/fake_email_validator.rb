require 'active_model'
require 'mail'

class FakeEmailValidator < ActiveModel::EachValidator

  I18N_SCOPE = 'fake_email_validator.validations.email'

  def initialize(options)
    super(options)

    fake_domains_file = File.expand_path('../../config/fake_domains.list', __FILE__)
    @fake_domains = File.readlines(fake_domains_file).map {|fd| fd.strip.downcase }
  end

  def validate_each(record, attribute, value)
    email = Mail::Address.new(value)

    domain = email.domain.strip.downcase
    is_fake = @fake_domains.include?(domain)

    record.errors.add attribute, I18n.t(:fake, scope: I18N_SCOPE) if is_fake
  rescue Mail::Field::ParseError
    record.errors.add attribute, I18n.t(:invalid, scope: I18N_SCOPE)
  end

end

ActiveSupport.on_load(:i18n) do
  I18n.load_path << File.expand_path('../../config/locales/en.yml', __FILE__)
end