require "bundler/inline"

gemfile do
  source 'https://rubygems.org'

  gem "rspec"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default: [:spec]
