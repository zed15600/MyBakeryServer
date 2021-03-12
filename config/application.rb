require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Postres
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Bogota'
    config.active_record.default_timezone = :local
    config.assets.enabled                  = true
    config.assets.digest                   = true
    config.assets.version                  = '1.0'
    config.assets.initialize_on_precompile = true
    config.assets.precompile += %w[
      sales.js
      payments.js
    ]
  end
end
