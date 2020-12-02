class Dummy::Pages::Orders::New < Bootstrap::Pages::Admin

  include Dummy::Pages::Orders::NewCodeRenderingUtils

  include Dummy::Pages::Orders::Form

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    page_heading title: t("orders.new.title"), subtitle: t("orders.new.subtitle") do
      transition path: dummy_orders_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "chevron-left"
          plain t("orders.new.back")
        end
      end
    end
    section_card do
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
