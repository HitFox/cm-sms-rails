# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cm_sms_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "cm-sms-rails"
  spec.version       = CmSmsRails.version
  spec.authors       = ["itschn"]
  spec.email         = ["michael.rueffer@hitfoxgroup.com"]

  spec.summary       = %q{Adapter for the cm-sms gem in rails.}
  spec.description   = %q{Send text messages by means of the HTTP protocol with the service of https://www.cmtelecom.com, from your rails app.}
  spec.homepage      = "https://github.com/HitFox/cm-sms-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  
  if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    spec.add_runtime_dependency "cm-sms", "~> 0.1"
    spec.add_runtime_dependency "rails", "~> 4.0"
    spec.add_runtime_dependency "rspec-activejob", "~> 0.4"
  else
    spec.add_dependency "cm-sms", "~> 0.1"
    spec.add_dependency "rails", "~> 4.0"
    spec.add_dependency "rspec-activejob", "~> 0.4"
  end
end
  

