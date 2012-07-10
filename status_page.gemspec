$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "status_page/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "status_page"
  s.version     = StatusPage::VERSION
  s.authors     = ["Petter Remen"]
  s.email       = ["petter.remen@gmail.com"]
  s.homepage    = "github.com/remen/status_page"
  s.summary     = "A very simplistic engine for a rails status page"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
