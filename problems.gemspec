# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'problem-solving'
  s.version     = '0.0.1'
  s.date        = '2015-06-18'
  s.summary     = "Basic structure for problem solving tasks"
  s.authors     = ["James Scicluna"]
  s.homepage    = 'https://github.com/jimbomt/problem-solving'
  s.license     = 'Medeo software license'

  s.files       = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.add_development_dependency("rspec")
  s.add_development_dependency("rake")
  s.add_development_dependency("pry")
  s.add_development_dependency("fivemat")
end
