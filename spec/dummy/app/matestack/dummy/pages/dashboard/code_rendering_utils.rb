module Dummy::Pages::Dashboard::CodeRenderingUtils

  include Dummy::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/dashboard/show.rb",
        title: "Dashboard Show Page"
      },
      {
        path: "app/matestack/dummy/components/dashboard/revenue.rb",
        title: "Revenue Component"
      },
      {
        path: "app/matestack/dummy/components/dashboard/products.rb",
        title: "Products Component"
      },
      {
        path: "app/matestack/dummy/components/dashboard/activity.rb",
        title: "Activity Component"
      },
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

  def rails_integration_partial
    code_grid_items = [
      {
        path: "app/controllers/dummy/dashboard_controller.rb",
        title: "Dashboard Controller"
      },
      {
        path: "app/controllers/dummy/base_controller.rb",
        title: "Dummy Base Controller"
      },
      {
        path: "config/routes.rb",
        title: "Rails Routes"
      },
      {
        path: "app/matestack/dummy/components/registry.rb",
        title: "Custom Component Registry"
      }
    ]
    render_code_grid code_grid_items, "rails_integration"
  end

end
