# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'omniauth/cobot/version'

Gem::Specification.new do |s|
  s.name = 'omniauth_cobot'
  s.summary = 'OmniAuth strategy for Cobot'
  s.email = 'alex@cobot.me'
  s.homepage = 'http://github.com/cobot/omniauth_cobot'
  s.description = 'OmniAuth strategy for Cobot'
  s.authors = ['Alexander Lang']
  s.version     = OmniAuth::Cobot::VERSION
  s.platform    = Gem::Platform::RUBY

  s.required_ruby_version = ['>=2.7', '<4']

  s.add_dependency 'omniauth-oauth2', '~>1.8.0'

  s.files         = `git ls-files`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.metadata['rubygems_mfa_required'] = 'true'
end
