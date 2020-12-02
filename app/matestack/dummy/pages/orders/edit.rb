class Dummy::Pages::Orders::Edit < Bootstrap::Pages::Admin

  include Dummy::Pages::Orders::EditCodeRenderingUtils

  include Dummy::Pages::Orders::Form

  def order
    Order.find(params[:id])
  end

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    page_heading title: "#{t("orders.edit.title")} # #{order.id}", subtitle: t("orders.edit.subtitle") do
      transition path: dummy_orders_path, delay: 300 do
        btn variant: :primary do
          bootstrap_icon name: "chevron-left"
          plain t("orders.edit.back")
        end
      end
    end
    section_card do
      div class: "w-50" do
        order_form_partial form_config
      end
    end
    section_card do
      heading size: 4, text: t("orders.edit.order_items.title"), class: "mb-4"
      async id: "order-items-list", rerender_on: "success" do
        paragraph class: "mb-4" do
          b text: t("orders.edit.order_items.total")
          plain "#{order.price_in_euro} €"
        end
        row do
          order.order_items.each do|item|
            col md: 4, class: "mb-4" do
              item_card(item)
            end
          end
        end
      end
    end
  end

  def item_card item
    card title: item.product.name, class: "h-100", body: "#{item.price_in_euro} €" do
      div class: "p-3" do
        action delete_item_config(item.id) do
          btn variant: :danger, size: :sm do
            plain t("orders.edit.order_items.delete")
          end
        end
      end
    end
  end

  def delete_item_config id
    {
      path: dummy_order_item_path(id),
      method: :delete,
      success: {
        emit: "success"
      }
    }
  end

  def form_config
    {
      for: order,
      path: dummy_order_path(id: order.id),
      method: :put,
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
