# frozen_string_literal: true

require_relative 'lib/legion/extensions/influxdb/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-influxdb'
  spec.version       = Legion::Extensions::Influxdb::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::Influxdb'
  spec.description   = 'Used to connect Legion to influxdb'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-influxdb'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-influxdb/src'
  spec.metadata['changelog_uri'] = 'https://bitbucket.org/legion-io/lex-influxdb/src/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'influxdb'
end
