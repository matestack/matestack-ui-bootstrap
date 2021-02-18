# require 'trailblazer'
# require 'trailblazer/rails'
# require 'trailblazer/cell'
# require 'cell/rails'
# require 'cell/haml'

require "matestack/ui/core"
require "matestack/ui/bootstrap/engine"

module Matestack
  module Ui
    module Bootstrap
      # https://github.com/rails/webpacker/blob/5-x-stable/docs/engines.md
      # ROOT_PATH = Pathname.new(File.expand_path("../../../../", Pathname.new(__FILE__).realpath))
      ROOT_PATH = Pathname.new(File.join(__dir__, "../../../"))

      class << self
        def webpacker
          @webpacker ||= ::Webpacker::Instance.new(
            root_path: ROOT_PATH,
            config_path: ROOT_PATH.join("config/webpacker.yml")
          )
        end
      end
    end
  end
end
