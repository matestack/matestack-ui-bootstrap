module Dummy::Pages::Customers::NewCodeRenderingUtils

  include Dummy::Pages::Customers::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/customers/new.rb",
        title: "Customers New Page"
      },
      {
        path: "app/matestack/dummy/pages/customers/form.rb",
        title: "Customers Form Partial in a Module for Reusability"
      }
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

end
