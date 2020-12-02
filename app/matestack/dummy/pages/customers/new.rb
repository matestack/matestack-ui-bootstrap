class Dummy::Pages::Customers::New < Matestack::Ui::Page

  include Dummy::Pages::Customers::NewCodeRenderingUtils

  include Dummy::Pages::Customers::Form

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    page_heading title: t("customers.new.title"), subtitle: t("customers.new.subtitle") do
      transition path: dummy_customers_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "chevron-left"
          plain t("customers.new.back")
        end
      end
    end
    section_card do
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
