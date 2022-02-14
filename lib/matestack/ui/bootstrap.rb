require "matestack/ui/core"
require "matestack/ui/vue_js"

base_path = 'matestack/ui/bootstrap'
require "#{base_path}/version"

module Matestack
  module Ui
    module Bootstrap
    end
  end
end

require "#{base_path}/base_component"
require "#{base_path}/base_vue_js_component"

module Matestack
  module Ui
    module Bootstrap
      module Layouts
      end
    end
  end
end
require "#{base_path}/layouts/admin_template"

module Matestack
  module Ui
    module Bootstrap
      module Layout
      end
    end
  end
end
require "#{base_path}/layout/row"
require "#{base_path}/layout/column"
require "#{base_path}/layout/container"
require "#{base_path}/layout/sidebar"

module Matestack
  module Ui
    module Bootstrap
      module Components
      end
    end
  end
end
require "#{base_path}/components/collapse"
require "#{base_path}/components/navbar"
require "#{base_path}/components/page_heading"
require "#{base_path}/components/section_card"
require "#{base_path}/components/carousel"
require "#{base_path}/components/tooltip"
require "#{base_path}/components/alert"
require "#{base_path}/components/breadcrumb"
require "#{base_path}/components/tab_nav"
require "#{base_path}/components/progress"
require "#{base_path}/components/toast"
require "#{base_path}/components/accordion"
require "#{base_path}/components/avatar"
require "#{base_path}/components/close"
require "#{base_path}/components/card"
require "#{base_path}/components/dropdown"
require "#{base_path}/components/modal"
require "#{base_path}/components/list_group"
require "#{base_path}/components/scrollspy"
require "#{base_path}/components/button"
require "#{base_path}/components/spinner"
require "#{base_path}/components/pagination"
require "#{base_path}/components/tab_nav_content"
require "#{base_path}/components/popover"
require "#{base_path}/components/badge"
require "#{base_path}/components/button_group"
require "#{base_path}/components/icon"

module Matestack
  module Ui
    module Bootstrap
      module Content
        module SmartCollection
        end
      end
    end
  end
end
require "#{base_path}/content/figure"
require "#{base_path}/content/smart_collection/collection"
require "#{base_path}/content/smart_collection/content"
require "#{base_path}/content/smart_collection/filter"
require "#{base_path}/content/smart_collection/paginate"

module Matestack
  module Ui
    module Bootstrap
      module Form
      end
    end
  end
end
require "#{base_path}/form/checkbox"
require "#{base_path}/form/input"
require "#{base_path}/form/textarea"
require "#{base_path}/form/radio"
require "#{base_path}/form/select"
require "#{base_path}/form/submit"
require "#{base_path}/form/switch"

require "#{base_path}/registry"
