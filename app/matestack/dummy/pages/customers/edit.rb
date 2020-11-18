class Dummy::Pages::Customers::Edit < Bootstrap::Pages::Admin

  include Dummy::Pages::Customers::Form

  def customer
    Customer.find(params[:id])
  end

  def response
    page_heading_partial title: "Customer # #{customer.id} | #{customer.last_name}" do
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
    section_wrapper do
      heading size: 4, text: "Orders", class: "mb-4"
      async id: "orders-list", rerender_on: "success" do
        paragraph class: "mb-4" do
          b text: "Total:"
          plain "#{customer.orders.count}"
        end
        row do
          customer.orders.each do|order|
            col md: 4, class: "mb-4" do
              order_card(order)
            end
          end
        end
      end
    end
  end

  def order_card order
    card title: "# #{order.id} | #{order.created_at.strftime("%d.%m.%Y")}", class: "h-100", body: "#{order.price_in_euro} €" do
      div class: "p-3" do
        order.order_items.each do |item|
          plain item.product.name
          br
        end
        br
        action delete_order_config(order.id) do
          btn variant: :danger, size: :sm do
            plain "delete"
          end
        end
        transition path: edit_dummy_order_path(order.id), delay: 300 do
          btn variant: :primary, outline: true, size: :sm do
            plain "show"
          end
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
