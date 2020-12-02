module Dummy::Pages::Customers::EditCodeRenderingUtils

  include Dummy::Pages::Customers::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/customer/edit.rb",
        title: "Customers Edit Page"
      },
      {
        path: "app/matestack/dummy/pages/customer/form.rb",
        title: "Customers Form Partial in a Module for Reusability"
      }
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

end
