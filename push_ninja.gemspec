$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "push_ninja/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "push_ninja"
  s.version     = PushNinja::VERSION
  s.authors     = ["Yoann Jean"]
  s.email       = ["yoann.jean@fullsix.com"]
  s.homepage    = "http://full-booster.com/"
  s.summary     = "Push device data to PushNinja"
  s.description = "Easiest way to push devices to PushNinja"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.7"

  # s.add_development_dependency "sqlite3"
end
