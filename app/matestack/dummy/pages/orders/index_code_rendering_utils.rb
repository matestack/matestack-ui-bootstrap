module Dummy::Pages::Orders::IndexCodeRenderingUtils

  include Dummy::Pages::Orders::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/orders/index.rb",
        title: "Orders Index Page"
      }
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

end
