
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rss_watcher/version"

Gem::Specification.new do |spec|
  spec.name          = "rss_watcher"
  spec.version       = RssWatcher::VERSION
  spec.authors       = ["Owais"]
  spec.email         = ["owaiswiz@gmail.com"]

  spec.summary       = %q{A Ruby Gem For Watching RSS Feeds}
  spec.homepage      = "https://github.com/owaiswiz/rss_watcher"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rss", "~> 0.2.8"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
