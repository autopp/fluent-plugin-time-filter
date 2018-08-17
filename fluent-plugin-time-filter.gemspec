lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fluent/plugin/time/filter/version'

Gem::Specification.new do |spec|
  spec.name          = 'fluent-plugin-time-filter'
  spec.version       = Fluent::Plugin::Time::Filter::VERSION
  spec.authors       = ['autopp']
  spec.email         = ['autopp.inc@gmail.com']

  spec.summary       = 'Fluentd plugin to filter old records'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/autopp/fluent-plugin-time-filter'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.58.2'
end
