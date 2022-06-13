class Dummy::Pages::Orders::IsolatedOffcanvasContent < Matestack::Ui::IsolatedComponent

  include Dummy::Components::Registry
  include Dummy::Pages::Orders::Form

  def response
    if order
      bs_page_heading title: "#{t("orders.edit.title")} # #{order.id}", subtitle: t("orders.edit.subtitle")
      order_form_partial form_config
      order_items_partial
    end
  end

  def authorized?
    current_admin.present?
  end

  def order
    Order.find(public_context.id)
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

  def order_items_partial
    heading size: 4, text: t("orders.edit.order_items.title"), class: "mb-4"
    async id: "order-items-list", rerender_on: "success" do
      paragraph class: "mb-4" do
        b text: t("orders.edit.order_items.total")
        plain "#{order.price_in_euro} €"
      end
      order.order_items.each do|item|
        div class: "mb-4" do
          item_card(item)
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
        emit: :success
      },
      failure: {
        emit: :failure
      }
    }
  end

end
