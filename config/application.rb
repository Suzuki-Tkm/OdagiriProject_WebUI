require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WebUI
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
    config.action_controller.permit_all_parameters = true
    # config.eager_load_paths << Rails.root.join("extras")

    config.exceptions_app = ->(env) do
      ErrorsController.action(:show).call(env)
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000' # クライアントのオリジンを指定
        resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete], credentials: true
      end
    end
  end
end
