# Smart collection

Render a collection in a paginated, filterable table with custom row action slots or with completely customized collection rendering \(e.g. cards per item instead of table rows\)

## `bs_smart_collection(*args)`

**Optional options**

Docs in progress! Please review the examples.

## Examples

### Example 1: Table rendering with custom row actions

```ruby
def response
  #...
  bs_smart_collection collection_config
  #...
end

def collection_config
  {
    id: 'customers',
    items: Customer.all,
    paginate: 10,
    rerender_on: "success",
    hoverable: true,
    columns: {
      id: 'ID',
      first_name: "First Name",
      last_name: "Last Name",
      street: "Street",
      house_number: "House Number",
      postal_code: "Postal Code",
      city: "City"
    },
    filters: {
      last_name: {
        placeholder: 'Filter by Last Name',
        match: :like,
      }
    },
    slots: {
      table_item_actions: method(:table_item_actions)
    }
  }
end

def table_item_actions customer
  slot do
    transition path: edit_dummy_customer_path(customer), delay: 300 do
      bs_btn outline: true, size: :sm, variant: :primary, class: "m-1" do
        bs_icon name: 'arrow-right', size: 20
      end
    end
    action customer_delete_action_config(customer) do
      bs_btn outline: true, size: :sm, variant: :danger, class: "m-1" do
        bs_icon name: 'trash2', size: 20
      end
    end
  end
end

def customer_delete_action_config customer
  {
    method: :delete,
    path: dummy_customer_path(id: customer.id),
    confirm: true,
    success: {
      emit: "success"
    }
  }
end
```

### Example 2: Table rendering with joined model and formatted col data rendering

```ruby
def response
  #...
  bs_smart_collection collection_config
  #...
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
        text: :end
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
  slot do
    transition path: edit_dummy_order_path(order), delay: 300 do
      bs_btn outline: true, size: :sm, variant: :primary do
        bs_icon name: 'arrow-right', size: 20
      end
    end
  end
end
```

### Example 3: Custom collection rendering

```ruby
def response
  #...
  bs_smart_collection collection_config
  #...
end

def collection_config
  {
    id: 'products',
    items: Product.all,
    paginate: 15,
    rerender_on: "success",
    filters: {
      name: {
        placeholder: 'Filter by Name',
        match: :like
      },
    },
    slots: {
      collection_rendering: method(:collection_rendering)
    }
  }
end

def collection_rendering products
  slot do
    bs_row do
      products.each do |product|
        bs_col xl: 4, class: "mb-3" do
          collection_card product
        end
      end
    end
  end
end

def collection_card product
  bs_card title: product.name, subtitle: "#{product.price_in_euro} €", class: "h-100" do
    paragraph class: "fw-lighter", text: product.description
    transition path: edit_dummy_product_path(product), delay: 300 do
      bs_btn outline: true, size: :sm, variant: :primary do
        bs_icon name: 'arrow-right', size: 20
      end
    end
    action product_delete_action_config(product) do
      bs_btn outline: true, size: :sm, variant: :danger do
        bs_icon name: 'trash2', size: 20
      end
    end
  end
end

def product_delete_action_config product
  {
    method: :delete,
    path: dummy_product_path(id: product.id),
    confirm: true,
    success: {
      emit: "success"
    }
  }
end
```

