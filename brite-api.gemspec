require File.expand_path('../lib/brite-api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Mohit Jain']
  gem.email         = ['jain.mohit27@gmail.com']
  gem.description   = 'Ruby client for BriteVerify API'
  gem.summary       = 'Ruby client for BriteVerify API'
  gem.homepage      = 'https://github.com/mohitjain/brite_verify'

  gem.files         = Dir.glob('lib/**/**') + ['README.md', 'LICENSE']
  gem.name          = 'brite_verify'
  gem.require_paths = ['lib']
  gem.licenses      = ['MIT']
  gem.version       = BriteAPI::VERSION

  gem.required_rubygems_version = '>= 1.3.6'
  gem.required_ruby_version = Gem::Requirement.new('>= 1.9')
  gem.add_runtime_dependency 'rest', '~> 3.0.6'
  gem.add_dependency "breaker"
  gem.add_dependency 'recursive-open-struct'
  gem.add_development_dependency 'bundler', '> 1.0.0'
end
