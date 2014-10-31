require 'mail'

class FakeEmailService

  def initialize
    fake_domains_file = File.expand_path('../../config/fake_domains.list', __FILE__)
    @fake_domains = File.readlines(fake_domains_file).map {|fd| fd.strip.downcase }
  end

  def is_fake_email?(email)
    email_address = Mail::Address.new(email)

    domain = email_address.domain.strip.downcase
    second_level_domain = domain.split('.')[-2..-1].join('.')

    domains = [domain, second_level_domain]

    @fake_domains.any? {|fake_domain| domains.include?(fake_domain) }
  end

end