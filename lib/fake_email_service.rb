require 'mail'
require 'resolv'

class FakeEmailException < StandardError
end

class FakeEmailService

  def initialize
    fake_domains_file = File.expand_path('../../config/fake_domains.list', __FILE__)
    @fake_domains = File.readlines(fake_domains_file).map {|fd| fd.strip.downcase }
  end

  def domain_in_parts domain
    domain = domain.strip.downcase
    domain_parts = domain.split('.')

    second_level_domain = Array(domain_parts[-2..-1]).join('.')
    third_level_domain = Array(domain_parts[-3..-1]).join('.')

    [domain, second_level_domain, third_level_domain].compact
  end

  def resolve_mx_domains domain
    Resolv::DNS.open.getresources( domain, Resolv::DNS::Resource::IN::MX).map { |s| s.exchange.to_s }
  end

  def is_fake_email?(email)
    email_address = Mail::Address.new(email)

    domain = email_address.domain

    raise FakeEmailException, 'Domain part in email is not present' if domain.blank?

    email_domains = [domain].concat(resolve_mx_domains(domain)).map { |domain| domain_in_parts(domain) }.flatten.uniq.reject { |c| c.empty? }

    @fake_domains.any? {|fake_domain| email_domains.include?(fake_domain) }
  end

end