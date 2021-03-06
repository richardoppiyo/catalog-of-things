require_relative 'lib/catalog/of/things/version'

Gem::Specification.new do |spec|
  spec.name = 'catalog-of-things'
  spec.version = Catalog::Of::Things::VERSION
  spec.authors = ['Victor Peralta']
  spec.email = ['victor.peralta.gomez@gmail.com']

  spec.summary = 'Write a short summary, because RubyGems requires one.'
  spec.description = 'Write a longer description or delete this line.'
  spec.homepage = 'https://github.com/richardoppiyo/catalog-of-things'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['allowed_push_host'] = 'https://github.com/richardoppiyo/catalog-of-things'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/richardoppiyo/catalog-of-things'
  spec.metadata['changelog_uri'] = 'https://github.com/richardoppiyo/catalog-of-things'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
