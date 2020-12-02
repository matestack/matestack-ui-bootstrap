module Dummy::Pages::Orders::EditCodeRenderingUtils

  include Dummy::Pages::Orders::CodeRenderingUtils

  def matestack_implementation_partial
    code_grid_items = [
      {
        path: "app/matestack/dummy/pages/orders/edit.rb",
        title: "Orders Edit Page"
      },
      {
        path: "app/matestack/dummy/pages/orders/form.rb",
        title: "Orders Form Partial in a Module for Reusability"
      }
    ]
    render_code_grid code_grid_items, "matestack_implementation"
  end

end
