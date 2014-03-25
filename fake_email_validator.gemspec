# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'fake_email_validator'
  spec.version       = '0.0.1'
  spec.authors       = ['Maxim Dobryakov']
  spec.email         = ['maxim.dobryakov@gmail.com']
  spec.summary       = %q{E-Mail validator for Rails to block services like mailinator.com}
  spec.description   = %q{E-Mail validator for Rails to block services like mailinator.com}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'

  spec.add_runtime_dependency 'activemodel'
  spec.add_runtime_dependency 'mail'
end
