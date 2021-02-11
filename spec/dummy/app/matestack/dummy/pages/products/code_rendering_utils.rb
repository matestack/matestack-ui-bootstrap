module Dummy::Pages::Products::CodeRenderingUtils

  include Dummy::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/products/index.rb",
        title: "Products Index Page"
      }
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

  def rails_integration_partial
    code_grid_items = [
      {
        path: "app/controllers/dummy/products_controller.rb",
        title: "Products Controller"
      },
      {
        path: "app/controllers/dummy/base_controller.rb",
        title: "Dummy Base Controller"
      },
      {
        path: "config/routes.rb",
        title: "Rails Routes"
      }
    ]
    render_code_grid code_grid_items, "rails_integration"
  end

end
