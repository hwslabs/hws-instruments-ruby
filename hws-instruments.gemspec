# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'hws-instruments'
  spec.version       = '0.1.0'
  spec.authors       = ['Hypto Engineering Team']
  spec.email         = ['engineering@hypto.in']

  spec.summary       = 'Instruments library'
  spec.description   = 'Instruments library'
  spec.homepage      = 'https://github.com/hwslabs/hws-instruments-ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/hwslabs/hws-insruments-ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/hwslabs/hws-insruments-ruby/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hws-connectors', '0.1.1'
  spec.add_dependency 'lsuuid', '0.1.0'
end
