#https://github.com/rails/webpacker/blob/5-x-stable/docs/engines.md

require "webpacker/helper"

module Matestack
  module Ui
    module Bootstrap
      module ApplicationHelper
        include ::Webpacker::Helper

        def current_webpacker_instance
          Matestack::Ui::Bootstrap::Engine.webpacker
        end
      end
    end
  end
end
