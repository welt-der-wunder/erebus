$:.push File.expand_path("../lib", __FILE__)
require "erebus/version"

Gem::Specification.new do |s|
  s.name        = "erebus"
  s.version     = Erebus::VERSION
  s.summary     = "Blockchain Technology Library for Ruby"
  s.authors     = [ "Welt der Wunder Sendebetrieb GmbH" ]
  s.email       = [ "service@weltderwunder.de" ]
  s.files       = [ "lib/erebus.rb" ]
  s.homepage    = "https://github.com/welt-der-wunder/erebus"
  s.license     = "MIT"

  s.required_ruby_version = ">= 2.6.5"

end