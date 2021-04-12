require_relative "./registry"

module Matestack
  module Ui
    module Bootstrap
      class BaseComponent < Matestack::Ui::Component

        include Matestack::Ui::Bootstrap::Registry

      end
    end
  end
end
