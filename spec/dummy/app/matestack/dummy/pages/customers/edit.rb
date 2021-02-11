class Dummy::Pages::Customers::Edit < Matestack::Ui::Page

  include Dummy::Pages::Customers::EditCodeRenderingUtils

  include Dummy::Pages::Customers::Form

  def customer
    Customer.find(params[:id])
  end

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    bs_page_heading title: "#{t("customers.edit.title")} # #{customer.id} | #{customer.last_name}" do
      transition path: dummy_customers_path, delay: 300 do
        bs_btn variant: :primary do
          bs_icon name: "chevron-left"
          plain t("orders.edit.back")
        end
      end
    end

    bs_section_card do
      bs_row do
        bs_col xl: 6 do
          customer_form_partial form_config
        end
      end
    end

    bs_section_card do
      heading size: 4, text: t("customers.edit.orders.title"), class: "mb-4"
      async id: "orders-list", rerender_on: "success" do
        paragraph class: "mb-4" do
          b text: t("customers.edit.orders.total")
          plain "#{customer.orders.count}"
        end
        bs_row do
          customer.orders.each do|order|
            bs_col md: 4, class: "mb-4" do
              order_card(order)
            end
          end
        end
      end
    end
  end

  def order_card order
    bs_card title: "# #{order.id} | #{order.created_at.strftime("%d.%m.%Y")}", class: "h-100", subtitle: "#{order.price_in_euro} €" do
      order.order_items.each do |item|
        plain item.product.name
        br
      end
      br
      action delete_order_config(order.id) do
        bs_btn variant: :danger, size: :sm do
          plain t("customers.edit.orders.delete")
        end
      end
      transition path: edit_dummy_order_path(order.id), delay: 300 do
        bs_btn variant: :primary, outline: true, size: :sm do
          plain t("customers.edit.orders.show")
        end
      end
    end
  end

  def delete_order_config id
    {
      path: dummy_order_path(id),
      method: :delete,
      success: {
        emit: "success"
      },
      confirm: true
    }
  end

  def form_config
    {
      for: customer,
      path: dummy_customer_path(id: customer.id),
      method: :put,
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
