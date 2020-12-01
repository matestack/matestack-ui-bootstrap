class Dummy::Pages::Products::New < Bootstrap::Pages::Admin

  include Dummy::Pages::Products::Form

  def response
    page_heading title: "New Product" do
      transition path: dummy_products_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "chevron-left"
          plain "Back"
        end
      end
    end
    section_card do
      div class: "w-50" do
        product_form_partial form_config
      end
    end
  end

  def form_config
    {
      for: Product.new,
      path: dummy_products_path,
      method: :post,
      delay: 300,
      success: {
        emit: :success,
        transition: {
          path: dummy_products_path
        }
      },
      failure: {
        emit: :failure
      }
    }
  end

end
