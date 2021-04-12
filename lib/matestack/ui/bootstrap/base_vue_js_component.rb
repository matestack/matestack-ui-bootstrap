require_relative "./registry"

module Matestack
  module Ui
    module Bootstrap
      class BaseVueJsComponent < Matestack::Ui::VueJsComponent

        include Matestack::Ui::Bootstrap::Registry

      end
    end
  end
end
