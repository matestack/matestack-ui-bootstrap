source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# For dummy application
gem 'devise'
gem 'faker'
gem 'paper_trail'
gem 'redcarpet' # for markdown usage
gem 'rouge' # for syntax highlighting

gem 'bootsnap', require: false


# Declare your gem's dependencies in matestack-ui-material.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

gem 'rails', '6.1.2'

gem 'rspec-rails', '~> 4.0.2'
gem 'capybara'
gem 'webpacker', '~> 5.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'selenium-webdriver'
gem 'puma'
gem 'simplecov', require: false, group: :test
gem 'byebug'
gem 'webmock'
gem 'redis'

group :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem "generator_spec"
  gem "rspec-retry" # repeating flaky tests
  gem "rspec-wait"
end
