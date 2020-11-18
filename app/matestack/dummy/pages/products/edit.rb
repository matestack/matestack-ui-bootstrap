class Dummy::Pages::Products::Edit < Bootstrap::Pages::Admin

  include Dummy::Pages::Products::Form

  def product
    Product.find(params[:id])
  end

  def response
    page_heading_partial title: "Product # #{product.id} | #{product.name}" do
      transition path: dummy_products_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "chevron-left"
          plain "Back"
        end
      end
    end
    section_wrapper do
      div class: "w-50" do
        product_form_partial form_config
      end
    end
  end

  def form_config
    {
      for: product,
      path: dummy_product_path(id: product.id),
      method: :put,
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
