---
description: Matestack Ui Bootstrap - Beautiful, reactive web UIs, Ruby and you!
---

# Welcome

{% hint style="info" %}
Version 3 was released on in February 2022. Click here for more [details](migrate-from-2.x-to-3.0.md)

**Most important changes:**

* Split `matestack-ui-core` into `matestack-ui-core` and `matestack-ui-vuejs`
* Rails 7 support
* Vue 3 support in `matestack-ui-vuejs`

****

You're reading the docs for 3.0 --> If you want to see the docs for Version 2.1, click [here](https://docs.matestack.io/matestack-ui-bootstrap/v/2.1/)
{% endhint %}

`matestack-ui-bootstrap` ships all you need to build **reactive AND styled** UIs in **pure Ruby** orchestrating styled components (based on Bootstrap v5) with a simple Ruby DSL. Additionally smart CRUD components helps you building beautiful data-driven admin and application UIs.

All features of `matestack-ui-core` and `matestack-ui-vuejs` can be mixed in which gives you maximum flexibility while implementing your UIs.

### Compatibility

`matestack-ui-bootstrap` requires `matestack-ui-vuejs` and `matestack-ui-core`

`matestack-ui-bootstrap` is tested against:

* Rails 7.0.1 + Ruby 3.0.0 + Vue.js 3.2.26
* Rails 6.1.1 + Ruby 3.0.0 + Vue.js 3.2.26
* Rails 6.1.1 + Ruby 2.7.2 + Vue.js 3.2.26
* Rails 6.0.3.4 + Ruby 2.6.6 + Vue.js 3.2.26
* Rails 5.2.4.4 + Ruby 2.6.6 + Vue.js 3.2.26

Rails versions below 5.2 are not supported.

Vue.js 2.x is supported when using the Compat build of Vue.js

### Documentation/Installation

Detailed documentation can be found [here](https://docs.matestack.io/matestack-ui-bootstrap/)

### Feature walk-through

{% hint style="info" %}
You might want to have a look at the dummy app in oder to better understand what kind of results you get out of `matestack-ui-bootstrap`

![](broken-reference) --> [https://dummy.matestack.io/](https://dummy.matestack.io)
{% endhint %}

#### All Bootstrap v5 components, available in pure Ruby

Alongside smart components, `matestack-ui-boostrap` ships all Bootstrap v5 components enabling you to use them in pure Ruby.

Imagine adding a Bootstrap \`card\` component within one line of Ruby, skipping recreating the required DOM structures again and again?

```ruby
bs_card title: "foo", body: "bar" #bs_card is shipped within matestack-ui-bootstrap
```

renders:

```markup
<div class="card">
  <div class="card-body">
    <h5 class="card-title">foo</h5>
    <p class="card-text">bar</p>
  </div>
</div>
```

Mix that with Matestack's core components, Bootstrap's utility classes or custom CSS for customized UI implementation. That means you're able to use Bootstrap and `matestack-ui-boostrap` components with a high level of abstraction for maximum productivity right next to core components like \`div\` with a lower level of abstraction for maximum flexibility!

On top of that, you're able to use all kinds of methods in order to render your UI based on conditions like \`current\_user.is\_super\_admin?\`. Adjusting the UI to your custom rules based on pure Ruby is super easy. That's what we call `flexible abstraction`!

The following code snippet demonstrates the usage of components shippend in `matestack-ui-bootstrap` (`bs_*`) alongside using utility classes (`mt-3`) and `matestack-ui-core` components (`small`,`b` ...) and reactive components from `matestack-ui-vuejs` (`transition`):

```ruby
class MyAdmin::Pages::Customer::Index < Matestack::Ui::Page

  def response
    bs_container do
      bs_row do
        Customer.last(6).each do |customer|
          bs_col sm: 4, class: "mt-3" do
            card_for(customer)
          end
        end
      end
    end
  end

  def card_for customer
    bs_card title: customer.name, img_path: asset_pack_url('.../xyz.png'), class: "shadow-sm" do
      card_body_for(customer)
    end
  end

  def card_body_for customer
    small class: "mb-3" do
      b text: "Email:"
      plain customer.email
    end
    if current_user.is_super_admin?
      transition path: form_path(id: customer.id) do
        bs_btn size: :sm, text: "edit", class: "mt-3"
      end
    end
  end

end
```

#### Flexible, responsive, prebuilt app layouts

Use our prebuilt app templates through class inheritance in order to quickly setup typical layouts including sidebar and header navigation. Styles can be customized via SCSS theming.

Thanks to the fact that you're dealing with pure Ruby classes, it's also pretty easy to modify prebuilt UI structures and appearance in order to tailor the admin app to your individual needs.

```ruby
class MyAdmin::Layout < Matestack::Ui::Bootstrap::Layouts::AdminTemplate

  # the response method is defined by the parent class
  # you just need to pass in some configuration using the methods below
  # it's still possible to overwrite and adjust the response method
  # defined in the parent class

  def sidebar_top_partial
    div class: "text-center" do
      transition path: root_path, delay: 300 do
        h4 "Your Rails Backend"
      end
    end
    div class: "text-center my-5" do
      bs_avatar img_path: asset_pack_url('media/images/avatar-placeholder.png')
      div class: "my-3" do
        plain current_admin.email
      end
    end
  end

  def sidebar_navigation_items
    [
      { type: :transition, path: dummy_dashboard_path, text: "Dashboard", icon: "columns-gap" },
      { type: :transition, path: dummy_products_path, text: "Products", icon: "box" },
      { type: :transition, path: dummy_customers_path, text: "Customers", icon: "people-fill" },
      { type: :transition, path: dummy_orders_path, text: "Orders", icon: "cart-check-fill"},
    ]
  end

  def toasts
    [
      { show_on: "failure", class: "bg-danger text-white", body: "Error!" },
      { show_on: "success", class: "bg-primary text-white", body: "Success!" },
    ]
  end
```

leading to something like this (layout with sidebar and toasts tiggered on form and action submissions, page content is obviously defined somewhere else ;) -->

![](broken-reference)

#### Powerful page layout components for great UI experience

Use components like `bs_page_heading` or `bs_section_card` together with grid components like `bs_row` and `bs_col` in order to quickly create a well structured, consistent and good looking UI.

Split rendering of complex, data-intesive UIs with Matestack's VueJs `async` component and increase initial page load performance! All **without** writing one line of JavaScript:

```ruby
class MyAdmin::Pages::Dashboard::Show < Matestack::Ui::Page

  def response
    bs_page_heading title: t("dashboard.title"), subtitle: t("dashboard.subtitle")
    bs_row do
      bs_col md: 6 do
        analytics_partial
      end
      bs_col md: 6 do
        activity_partial
      end
    end
  end

  def analytics_partial
    async defer: 300, id: "products-card" do
      MyAdmin::Components::Dashboard::Products.call()
    end
    async defer: 600, id: "revenue-card" do
      MyAdmin::Components::Dashboard::Revenue.call()
    end
  end

  def activity_partial
    bs_row do
      bs_col do
        async defer: 900, rerender_on: "activity-tracked", id: "activity-card" do
          MyAdmin::Components::Dashboard::Activity.call()
        end
      end
    end
  end

end
```

and e.g.:

```ruby
class MyAdmin::Components::Dashboard::Revenue < Matestack::Ui::Component

  def response
    section_card title: t("dashboard.revenue.title"), subtitle: t("dashboard.revenue.subtitle") do
      row do
        col xl: 6 do
          text_kpis_partial
        end
        col xl: 6, class: "py-3" do
          chart_kpis_partial
        end
      end
    end
  end

  # ...

end
```

leading to something like this -->

![](broken-reference)

#### Chart.js components accessible in pure Ruby

Want to visualize some data in charts? Matestack UI Bootstrap let's you easily integrate chart.js (copy/paste once from example in documentation \[or choose any other chart library]) which from then on allows you to use chart components in pure Ruby without thinking of the JavaScript side!

Choose from `line`, `doughnut`, `bar` or `pie` charts and use theme colors for consistent coloring of datasets without touching CSS:

```ruby
class MyAdmin::Components::Dashboard::Products < Matestack::Ui::Component

  def response
    bs_section_card title: t("..."), subtitle: t("...") do
      bs_row do
        bs_col xl: 6 do
          text_kpis_partial
        end
        bs_col xl: 6, class: "py-3" do
          chart_kpis_partial
        end
      end
    end
  end

  protected

    # ...

    def chart_kpis_partial
      # Component available for copy/paste in matestack-ui-bootstrap docs!
      Components::ChartJs type: :doughnut,
        datasets: [
          {
            data: top_5_product_values,
            backgroundColor: [:primary, :secondary, :blue, :indigo, :info]
          },
        ],
        labels: top_5_product_names
    end

    def top_5_products
      OrderItem
        .group(:product_id)
        .sum(:price_in_euro)
        .sort_by{|k, v| v}
        .reverse
        .first(5)
    end

    def top_5_product_values
      top_5_products
        .map { |product_id, value| value }
    end

    def top_5_product_names
      top_5_products
        .map { |product_id, value| Product.find(product_id).name }
    end

end
```

which leads to something like this -->

![](broken-reference)

#### Reactive and styled forms in no time

`matestack-ui-vuejs` already ships reactive forms, usable with pure Ruby. Within `matestack-ui-bootstrap` you get styled form components, enabling you to create beautiful, reactive forms with a few lines of Ruby!

Create styled forms, with reactive error/success rendering without thinking of any implementation detail:

```ruby
class MyAdmin::Components::UsersForm < Matestack::Ui::Component

  required :user

  def response
    matestack_form form_config do
      bs_form_input   key: :name, type: :text, label: "Name"
      bs_form_input   key: :avatar, type: :file, label: "Avatar"
      bs_form_select  key: :role, options: [:client, :admin], label: "Role",
                        placeholder: "Select Role"
      bs_form_switch  key: :active, label: "Active?"
      bs_form_submit  button_variant: :primary, spinner_variant: :light, text: "Submit"
    end
  end

  def form_config
    {
      multipart: true, # due to file upload
      for: context.user,
      path: admin_user_path(context.user.id),
      method: :put,
      success: {
        emit: :success
      },
      failure: {
        emit: :failure
      }
    }
  end


end
```

which results in something like this --> (errors are rendered dynamically after async form submission, a error toast would trigger as well if added to the layout)

![](broken-reference)

#### Reactive, paginated, filterable tables, without the JavaScript hussle

Implementing a paginated, filterable collection is exhausting. And what about some reactivity when switching through the pages in order to avoid full page reloads? You don't want to build that yourself! That's why we've created the `collection` component, shipped within `matestack-ui-core`. The `bs_smart_collection` shipped with `matestack-ui-bootstrap` gives you even more:

A few lines of Ruby is enough to add a styled, reactive paginated table with filters to your UI! You can optionally modify column rendering and per-row actions via method injection:

```ruby
class MyAdmin::Pages::Orders::Index < Matestack::Ui::Page

  def response
    # ...
    bs_section_card do
      bs_smart_collection collection_config
    end
    # ...
  end

  def collection_config
    {
      id: 'orders',
      # Active Record query:
      items: Order.includes(:customer, :order_items).all,
      paginate: 10,
      rerender_on: "success",
      columns: {
        # just render the ID:
        id: 'ID',
        # render an attribute of a child model:
        'customer.last_name': {
          # use a specific table column heading:
          heading: 'Customer Name'
        },
        price_in_euro: {
          heading: 'Price in €',
          # transform the column content with a Proc:
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
        # inject a method which defines the per row actions:
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
```

which leads to something like this -->

![](broken-reference)

...and if you're not into tables, you can adjust the collection content rendering with some custom ruby code while keeping all the reactivity:

```ruby
class MyAdmin::Pages::Products::Index < Matestack::Ui::Page
  
  # ...
  
  def collection_config
    {
      id: 'products',
      items: Product.all,
      paginate: 9,
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
      paragraph product.description, class: "fw-lighter"
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


end
```

which then looks like this -->

![](broken-reference)
