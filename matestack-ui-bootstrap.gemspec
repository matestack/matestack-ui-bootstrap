$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "matestack/ui/bootstrap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "matestack-ui-bootstrap"
  spec.version     = Matestack::Ui::Bootstrap::VERSION
  spec.authors     = ["Jonas Jabari","Nils Henning"]
  spec.email       = ["jonas@matestack.io"]
  spec.homepage    = "https://matestack.org"
  spec.summary     = "Bootstrap v5 components for Matestack UI"
  spec.description = "Bootstrap v5 components for Matestack UI"

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "matestack-ui-core", "~> 1.4.0"
end
