#https://github.com/rails/webpacker/blob/5-x-stable/docs/engines.md

require "webpacker/helper"

module MyEngine
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      MyEngine.webpacker
    end
  end
end
