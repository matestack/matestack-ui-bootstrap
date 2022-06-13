class Dummy::Pages::Orders::Index < ApplicationPage

  include Dummy::Pages::Orders::IndexCodeRenderingUtils

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    bs_page_heading title: t("orders.index.title"), subtitle: t("orders.index.subtitle") do
      transition path: new_dummy_order_path, delay: 300 do
        bs_btn variant: :primary do
          bs_icon name: "plus"
          plain t("orders.index.add_order")
        end
      end
    end
    orders_board_partial

    bs_offcanvas(
      show_on: "replace_orders_isolated_offcanvas_content",
      placement: :end,
      backdrop: false,
      scroll: true,
      class: "shadow border-0"
      ) do
        Dummy::Pages::Orders::IsolatedOffcanvasContent.call(
          defer: true,
          replace_on: "replace_orders_isolated_offcanvas_content"
        )
    end
  end

  def orders_board_partial
    bs_row do
      bs_col xl: 4 do
        order_list_partial(status: :open, badge_variant: :primary)
      end
      bs_col xl: 4 do
        order_list_partial(status: :prepare_for_delivery, badge_variant: :info)
      end
      bs_col xl: 4 do
        order_list_partial(status: :delivered, badge_variant: :success)
      end
    end
  end

  def order_list_partial(status:, badge_variant:)
    orders = Order.send(status).includes(:customer, :order_items).all.order(position: :asc)

    div class: "bg-light-darker rounded p-2 h-100 d-flex flex-column" do
      div do
        bs_badge status.to_s.humanize.camelcase, variant: badge_variant, class: "mb-3"
      end
      div class: "h-100" do
        async rerender_on: :success, id: "#{status}-order-list" do
          if orders.empty?
            # if no data is on this list, render a bigger drop zone with position 0
            drop_zone drop_zone_config(status: status, css_class: "h-100")
          else
            div class: "d-flex flex-column h-100 align-content-start" do
              div do
                drop_zone drop_zone_config(status: status, position: orders.first.position)
              end
              div do
                orders.each do |order|
                  order_item_partial(order)
                  drop_zone drop_zone_config(status: status, position: order.position + 1)
                end
              end
              unless orders.count == 1
                div class: "h-100" do
                  drop_zone drop_zone_config(status: status, css_class: "h-100", position: orders.last.position + 1)
                end
              end
            end
          end
        end
      end
    end
  end

  def order_item_partial order
    draggable(draggable_id: order.id, drag_key: "order") do
      div class: "bg-white rounded p-2 mb-1" do
        div class: "mb-2" do
          h6 do
            onclick emit: 'replace_orders_isolated_offcanvas_content', public_context: { id: order.id } do
              plain order.position
              plain order.customer.last_name
              plain "#{order.price_in_euro} €"
            end
          end
        end
        transition path: edit_dummy_order_path(order), delay: 300 do
          bs_btn outline: true, size: :sm, variant: :primary do
            bs_icon name: 'arrow-right', size: 20
          end
        end
      end
    end
  end

  def drop_zone_config(status:, css_class: "", position: nil)
    {
      method: :put, # required
      path: change_status_by_drag_and_drop_dummy_orders_path, # required
      data: { status: status, position: position }, # required data for the update action
      drag_key: "order", # required, has to match the drag_key from the draggable component
      success: { emit: "success" }, # required, trigger rerendering of lists
      class: "dropzone rounded mb-1 #{css_class}", # optional: css styling
      highlight_class: "dropzone-highlight", # optional: css styling highlighting a drop zone
      hover_class: "dropzone-hover" # optional: used in css animation on drag hover
    }
  end

end
