require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BBQ
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    config.i18n.default_locale = :ru
    config.time_zone = 'Asia/Yekaterinburg'
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.helper false
      g.decorator false
      g.temlate_engine :slim
      g.stylesheet false
    end
    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
