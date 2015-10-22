# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
version_number = File.read(File.join(File.dirname(__FILE__), 'VERSION')).strip

Gem::Specification.new do |spec|

  spec.name          = 'cucumber_steps'

  spec.version       = version_number
  spec.authors       = ['Adam Luzsi']
  spec.email         = ['adamluzsi@gmail.com']
  spec.summary       = %q{often used generic cucumber steps for DRY}
  spec.description   = %q{collection of often used cucumber steps to avoid the violation of DRY principle}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '>= 1.6'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'watir'
  spec.add_dependency 'rspec'
  spec.add_dependency 'cucumber'

end
