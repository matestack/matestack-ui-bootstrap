class Dummy::Pages::Customers::New < Bootstrap::Pages::Admin

  include Dummy::Pages::Customers::Form

  def response
    page_heading_partial title: "New Customer" do
      transition path: dummy_customers_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "chevron-left"
          plain "Back"
        end
      end
    end
    section_wrapper do
      div class: "w-50" do
        customer_form_partial form_config
      end
    end
  end

  def form_config
    {
      for: Customer.new,
      path: dummy_customers_path,
      method: :post,
      delay: 300,
      success: {
        emit: :success,
        transition: {
          path: dummy_customers_path
        }
      },
      failure: {
        emit: :failure
      }
    }
  end

end
