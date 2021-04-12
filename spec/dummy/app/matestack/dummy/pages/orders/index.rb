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
    async defer: true, id: "list" do
      bs_section_card title: t("orders.index.collection.title"), subtitle: t("orders.index.collection.subtitle").html_safe do
        bs_smart_collection collection_config
      end
    end
  end

  def collection_config
    {
      id: 'orders',
      items: Order.includes(:customer, :order_items).all,
      paginate: 10,
      rerender_on: "success",
      columns: {
        id: 'ID',
        'customer.last_name': {
          heading: 'Customer Name'
        },
        price_in_euro: {
          heading: 'Price in €',
          format: -> (column_data){ "#{column_data} €" },
          text: :right
        }
      },
      filters: {
        'customer.last_name': {
          placeholder: 'Filter by Customer Name',
          match: :starts_with,
        }
      },
      slots: {
        table_item_actions: method(:table_item_actions)
      }
    }
  end

  def table_item_actions order
    transition path: edit_dummy_order_path(order), delay: 300 do
      bs_btn outline: true, size: :sm, variant: :primary do
        bs_icon name: 'arrow-right', size: 20
      end
    end
  end

end
