class Dummy::Pages::Orders::Edit < ApplicationPage

  include Dummy::Pages::Orders::EditCodeRenderingUtils

  include Dummy::Pages::Orders::Form

  def order
    Order.find(params[:id])
  end

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    bs_page_heading title: "#{t("orders.edit.title")} # #{order.id}", subtitle: t("orders.edit.subtitle") do
      transition path: dummy_orders_path, delay: 300 do
        bs_btn variant: :primary do
          bs_icon name: "chevron-left"
          plain t("orders.edit.back")
        end
      end
    end

    bs_section_card do
      bs_row do
        bs_col xl: 6 do
          order_form_partial form_config
        end
      end
    end

    bs_section_card do
      heading size: 4, text: t("orders.edit.order_items.title"), class: "mb-4"
      async id: "order-items-list", rerender_on: "success" do
        paragraph class: "mb-4" do
          b text: t("orders.edit.order_items.total")
          plain "#{order.price_in_euro} €"
        end
        bs_row do
          order.order_items.each do|item|
            bs_col md: 4, class: "mb-4" do
              item_card(item)
            end
          end
        end
      end
    end
  end

  def item_card item
    bs_card title: item.product.name, class: "h-100", subtitle: "#{item.price_in_euro} €" do
      action delete_item_config(item.id) do
        bs_btn variant: :danger, size: :sm do
          plain t("orders.edit.order_items.delete")
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
