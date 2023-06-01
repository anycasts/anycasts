require_relative 'boot'
require_relative 'framework'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Anycasts
  class Application < Rails::Application
    config.load_defaults 7.0
    config.generators.system_tests = nil
  end
end
