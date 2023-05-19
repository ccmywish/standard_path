require_relative 'lib/standard_path'

Gem::Specification.new do |s|
  s.name = "standard_path"
  s.version = StandardPath::VERSION
  require 'date'
  s.date = Date.today.to_s

  s.summary = "Standard Path for corss-platform gems"

  s.description = <<~DESC
    Standard Path for corss-platform gems.
  DESC

  s.authors  = "Aoran Zeng"
  s.email    = "ccmywish@qq.com"
  s.homepage = "https://github.com/ccmywish/standard_path"
  s.license  = "MIT"

  s.files = Dir['lib/**/*'] << 'README.md' << 'LICENSE.txt'

  s.require_paths = ['lib']

  s.required_ruby_version = ">= 2.7.0"

  s.metadata = {
    "bug_tracker_uri" => "https://github.com/ccmywish/standard_path/issues",
    "source_code_uri" => "https://github.com/ccmywish/standard_path"
  }
end
