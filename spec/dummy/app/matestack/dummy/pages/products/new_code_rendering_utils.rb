module Dummy::Pages::Products::NewCodeRenderingUtils

  include Dummy::Pages::Products::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/products/new.rb",
        title: "Products New Page"
      },
      {
        path: "app/matestack/dummy/pages/products/form.rb",
        title: "Products Form Partial in a Module for Reusability"
      }
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

end
