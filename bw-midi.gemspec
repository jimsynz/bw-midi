# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bw-midi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["James Harton"]
  gem.email         = ["james@sociable.co.nz"]
  gem.description   = %q{This gem wraps the CoreMIDI framework in an more Rubyesque way}
  gem.summary       = %q{BubbleWrapper for CoreMIDI}
  gem.homepage      = "https://github.com/jamesotron/bw-midi"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bw-midi"
  gem.require_paths = ["lib"]
  gem.version       = BubbleWrap::MIDI::VERSION
  gem.add_dependency 'bubble-wrap'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'mac_bacon'
end
