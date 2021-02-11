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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "matestack-ui-core", "~> 1.4.0"
end
