# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth/cobot/version"

Gem::Specification.new do |s|
  s.name = "omniauth_cobot"
  s.summary = "OmniAuth strategy for Cobot"
  s.email = "alex@cobot.me"
  s.homepage = "http://github.com/cobot/omniauth_cobot"
  s.description = "OmniAuth strategy for Cobot"
  s.authors = ["Alexander Lang"]
  s.version     = OmniAuth::Cobot::VERSION
  s.platform    = Gem::Platform::RUBY

  s.add_dependency 'omniauth-oauth2', '~>1.8.0'

  s.add_development_dependency 'rake'

  s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
