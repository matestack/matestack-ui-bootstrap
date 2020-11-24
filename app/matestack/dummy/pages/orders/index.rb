class Dummy::Pages::Orders::Index < Bootstrap::Pages::Admin

  def response
    page_heading_partial title: "Orders"
    section_wrapper do
      smart_table table_config

      smart_table_v2 v2_config
    end
  end

  def v2_config
    {
      id: 'foobar',
      items: Order.includes(:customer, :order_items).all,
      paginate: 10,
      columns: {
        id: 'ID',
        'customer.last_name': {
          heading: 'Customer Name',
          filter: {
            placeholder: 'Filter by Customer Name',
            match: :starts_with,
          },
        },
        price_in_euro: {
          heading: 'Price in €',
          format: -> (s){ number_to_currency(s, locale: :de) },
          text: :right
        }
      },
      item_actions: ->(data) do
        transition path: edit_dummy_order_path(data) do
          btn outline: true, size: :sm, variant: :primary do
            bootstrap_icon name: 'arrow-right', size: 20
          end
        end
      end
    }
  end

  def table_config
    {
      base_query: Order.includes(:customer, :order_items).all, # ActiveRecord query, could be something different than .all
      columns: [ :id, "customer.last_name", :price_in_euro], # which columns should be shown?
      filters: filters, # optional: which filters should appear?
      paginate: 10, # optional: how many items should be shown per page?
      row_actions: row_actions, # optional: what actions should be possible per row?
      rerender_on: "success",
      threshold: 0,
    }
  end

  def filters
    [
      {
        column: :id,
        type: :input,
        match: :equals,
        threshold: 0,
        placeholder: "Search by ID"
      },
      {
        column: 'customer.last_name',
        type: :input,
        match: :starts_with,
        placeholder: 'Search by Last Name'
      }
    ]
  end

  def row_actions
    # configure what actions should appear per row as buttons with text or icons
    # pass in path as symbol, as it will be resolved within the smart_table component
    # for each iteration, calling the "id" of the instance of the current iteration
    [
      {
        type: :transition,
        icon: "arrow-right",
        btn_variant: :primary,
        path: :edit_dummy_order_path,
        params: { id: :id },
        delay: 300
      },
      {
        type: :action,
        icon: "trash2",
        btn_variant: :danger,
        method: :delete,
        path: :dummy_order_path,
        params: { id: :id },
        confirm: true,
        success: {
          emit: "success"
        }
      },
    ]
  end

end
