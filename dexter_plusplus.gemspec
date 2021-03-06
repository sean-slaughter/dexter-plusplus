require_relative 'lib/dexter_plusplus/version'

Gem::Specification.new do |spec|
  spec.name          = "dexter_plusplus"
  spec.version       = DexterPlusplus::VERSION
  spec.authors       = ["sean-slaughter"]
  spec.email         = ["sthompson2822@gmail.com"]

  spec.summary       = %q{A Ruby PokeDex Gem that allows users to explore Pokemon and Items in the Pokemon Universe }
  spec.homepage      = "https://github.com/sean-slaughter/dexter-plusplus"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sean-slaughter/dexter-plusplus"
  spec.metadata["changelog_uri"] = "https://github.com/sean-slaughter/dexter-plusplus"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
