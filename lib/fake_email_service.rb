require 'mail'

class FakeEmailService

  def initialize
    fake_domains_file = File.expand_path('../../config/fake_domains.list', __FILE__)
    @fake_domains = File.readlines(fake_domains_file).map {|fd| fd.strip.downcase }
  end

  def is_fake_email?(email)
    return false if email.blank?

    email_address = Mail::Address.new(email)

    domain = email_address.try(:domain).try(:strip).try(:downcase)
    return false if domain.blank?

    domain_parts = domain.split('.')

    second_level_domain = Array(domain_parts[-2..-1]).join('.')
    third_level_domain = Array(domain_parts[-3..-1]).join('.')

    domains = [domain, second_level_domain, third_level_domain].compact

    @fake_domains.any? {|fake_domain| domains.include?(fake_domain) }
  end

end