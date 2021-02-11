module Dummy::Pages::Products::IndexCodeRenderingUtils

  include Dummy::Pages::Products::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/products/index.rb",
        title: "Products Index Page"
      }
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

end
