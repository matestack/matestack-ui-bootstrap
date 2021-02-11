module Dummy::Pages::Customers::IndexCodeRenderingUtils

  include Dummy::Pages::Customers::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/customers/index.rb",
        title: "Customers Index Page"
      }
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

end
