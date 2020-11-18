class Dummy::Pages::Orders::New < Bootstrap::Pages::Admin

  include Dummy::Pages::Orders::Form

  def response
    page_heading_partial title: "New Order" do
      transition path: dummy_orders_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "chevron-left"
          plain "Back"
        end
      end
    end
    section_wrapper do
      div class: "w-50" do
        order_form_partial form_config
      end
    end
  end

  def form_config
    {
      for: Order.new,
      path: dummy_orders_path,
      method: :post,
      delay: 300,
      success: {
        emit: :success,
        transition: {
          path: dummy_orders_path
        }
      },
      failure: {
        emit: :failure
      }
    }
  end

end
