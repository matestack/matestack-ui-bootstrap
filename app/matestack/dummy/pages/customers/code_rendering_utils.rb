module Dummy::Pages::Customers::CodeRenderingUtils

  include Dummy::CodeRenderingUtils

  def rails_integration_partial
    code_grid_items = [
      {
        path: "app/controllers/dummy/customers_controller.rb",
        title: "Customers Controller"
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
