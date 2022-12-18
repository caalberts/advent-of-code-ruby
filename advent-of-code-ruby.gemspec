# frozen_string_literal: true

require_relative "lib/advent_of_code/version"

Gem::Specification.new do |spec|
  spec.name          = "advent-of-code"
  spec.version       = AdventOfCode::VERSION
  spec.authors       = ["Albert Salim"]
  spec.email         = ["albertlimca@gmail.com"]

  spec.summary       = "Advent of Code"
  spec.homepage      = "https://gitlab.com/caalberts/advent-of-code-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
