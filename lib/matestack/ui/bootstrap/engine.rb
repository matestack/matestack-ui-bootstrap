module Matestack
  module Ui
    module Bootstrap
      class Engine < ::Rails::Engine
        isolate_namespace Matestack::Ui::Bootstrap

        # https://github.com/rails/webpacker/blob/5-x-stable/docs/engines.md
        initializer "webpacker.proxy" do |app|
          insert_middleware = begin
                              Matestack::Ui::Bootstrap::Engine.webpacker.config.dev_server.present?
                            rescue
                              nil
                            end
          next unless insert_middleware

          app.middleware.insert_before(
            0, Webpacker::DevServerProxy, # "Webpacker::DevServerProxy" if Rails version < 5
            ssl_verify_none: true,
            webpacker: Matestack::Ui::Bootstrap::Engine.webpacker
          )
        end

      end
    end
  end
end
